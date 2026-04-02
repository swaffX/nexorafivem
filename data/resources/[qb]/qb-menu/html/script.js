const resourceName = "qb-menu";
let isDragging = false;
let dragModeActive = false;
let currentX, currentY, initialX, initialY;
let xOffset = 0, yOffset = 0;
let originalMenuData = [];

const container = document.getElementById('container');
const dragToggle = document.getElementById('dragToggle');
const savePositionBtn = document.getElementById('savePosition');
const closeMenuBtn = document.getElementById('closeMenuBtn');
const dragIndicator = document.getElementById('dragIndicator');
const positionSaved = document.getElementById('positionSaved');
const searchInput = document.getElementById('searchInput');
const buttonsContainer = document.getElementById('buttons');

// Load saved position
const savedPosition = localStorage.getItem('fivemMenuPosition');
if (savedPosition) {
    const pos = JSON.parse(savedPosition);
    container.style.left = pos.x + 'px';
    container.style.top = pos.y + 'px';
    container.style.transform = 'none';
}

// Setup drag functionality
dragToggle.addEventListener('click', function(e) {
    e.stopPropagation();
    toggleDragMode();
});


closeMenuBtn.addEventListener('click', function(e) {
    e.stopPropagation();
    cancelMenu();
});

function renderMenuItems(data) {
    let html = "";
    
    if (data.length === 0) {
        html = `<div class="menu-item no-results">Arama sonucu bulunamadı</div>`;
    } else {
        data.forEach((item) => {
            if (!item.hidden) {
                let header = item.header;
                let message = item.txt || item.text;
                let isMenuHeader = item.isMenuHeader;
                let isDisabled = item.disabled;
                let icon = item.icon;
                let originalIndex = item.originalIndex; // Orijinal indeksi sakla
                
                html += getButtonRender(header, message, originalIndex, isMenuHeader, isDisabled, icon);
            }
        });
    }
    
    buttonsContainer.innerHTML = html;
    attachButtonHandlers();
}

function toggleDragMode() {
    dragModeActive = !dragModeActive;
    
    if (dragModeActive) {
        dragToggle.classList.add('active');
        dragIndicator.classList.add('active');
        container.classList.add('dragging');
        container.style.cursor = 'move';
    } else {
        dragToggle.classList.remove('active');
        dragIndicator.classList.remove('active');
        container.classList.remove('dragging');
        container.style.cursor = 'default';
    }
}

container.addEventListener("mousedown", function(e) {
    if (!dragModeActive) return;
    
    initialX = e.clientX - xOffset;
    initialY = e.clientY - yOffset;
    
    if (e.target === container || e.target.closest('.menu-header')) {
        isDragging = true;
    }
});

document.addEventListener("mouseup", function() {
    isDragging = false;
});

document.addEventListener("mousemove", function(e) {
    if (!isDragging || !dragModeActive) return;
    
    e.preventDefault();
    
    currentX = e.clientX - initialX;
    currentY = e.clientY - initialY;
    
    xOffset = currentX;
    yOffset = currentY;
    
    container.style.transform = "translate3d(" + currentX + "px, " + currentY + "px, 0)";
});

function savePosition() {
    const rect = container.getBoundingClientRect();
    localStorage.setItem('fivemMenuPosition', JSON.stringify({
        x: rect.left,
        y: rect.top
    }));
    
    positionSaved.classList.add('show');
    setTimeout(() => {
        positionSaved.classList.remove('show');
    }, 2000);
    
    dragModeActive = false;
    dragToggle.classList.remove('active');
    dragIndicator.classList.remove('active');
    container.classList.remove('dragging');
    container.style.cursor = 'default';
}

const openMenu = (data = null) => {
    if (!data || data.length === 0) return;
    
    // Orijinal indeksleri ekleyerek sakla
    originalMenuData = data.map((item, index) => ({
        ...item,
        originalIndex: index
    }));
    
    renderMenuItems(originalMenuData);
    
    container.style.display = "block";
    setTimeout(() => {
        container.classList.add('active');
    }, 10);
};

const getButtonRender = (header, message = null, originalIndex, isMenuHeader, isDisabled, icon) => {
    let iconHtml = "";
    if (icon) {
        if (icon.startsWith("http") || icon.startsWith("https") || icon.startsWith("data:")) {
            iconHtml = `<img src="${icon}" alt="icon" style="width:20px; height:20px;">`;
        } else if (icon.startsWith("fa-")) {
            iconHtml = `<i class="fas ${icon}"></i>`;
        } else {
            
        }
    } else {
        iconHtml = isMenuHeader ? `<i class="fas fa-info-circle"></i>` : `<i class="fas fa-arrow-right"></i>`;
    }
    
    const itemClass = isMenuHeader ? "title" : `button ${isDisabled ? "disabled" : ""}`;
    
    return `
        <div class="menu-item ${itemClass}" data-original-index="${originalIndex}">
            <div class="text-content">
                <div class="header">${header}</div>
                ${message ? `<div class="text">${message}</div>` : ""}
            </div>
        </div>
    `;
};

function attachButtonHandlers() {
    $('.button').click(function() { 
        const target = $(this);
        if (!target.hasClass('disabled')) {
            // Orijinal indeksi data attribute'dan al
            const originalIndex = target.data('original-index');
            postData(originalIndex);
        }
    });
}

const closeMenu = () => {
    container.classList.remove('active');
    setTimeout(() => {
        container.style.display = "none";
        buttonsContainer.innerHTML = "";
        originalMenuData = [];
        
        dragModeActive = false;
        dragToggle.classList.remove('active');
        dragIndicator.classList.remove('active');
        container.classList.remove('dragging');
        container.style.cursor = 'default';
    }, 300);
};

const postData = (originalIndex) => {
    $.post(`https://${resourceName}/clickedButton`, JSON.stringify(originalIndex + 1));
    closeMenu();
};

const cancelMenu = () => {
    $.post(`https://${resourceName}/closeMenu`);
    closeMenu();
};

window.addEventListener("message", (event) => {
    const data = event.data;
    const buttons = data.data;
    const action = data.action;
    switch (action) {
        case "OPEN_MENU":
        case "SHOW_HEADER":
            return openMenu(buttons);
        case "CLOSE_MENU":
            return closeMenu();
        default:
            return;
    }
});

document.onkeyup = function(event) {
    const charCode = event.key;
    if (charCode == "Escape") {
        cancelMenu();
    }
};