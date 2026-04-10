// Envanter durumu
let inventoryData = {
    items: [],
    clothing: {},
    weight: 0,
    maxWeight: 50
};

// Slot sayıları
const SLOTS_PER_ROW = 8;
const TOTAL_ROWS = 5;
const TOTAL_SLOTS = SLOTS_PER_ROW * TOTAL_ROWS;

// NUI Mesaj dinleyici
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.type) {
        case 'open':
            inventoryData.items = data.inventory || [];
            inventoryData.clothing = data.clothing || {};
            inventoryData.weight = data.weight || 0;
            inventoryData.maxWeight = data.maxWeight || 50;
            openInventory();
            break;
        case 'close':
            closeInventory();
            break;
        case 'updateClothing':
            inventoryData.clothing = data.clothing || {};
            updateClothingSlots();
            break;
    }
});

// Envanter aç
function openInventory() {
    document.getElementById('app').classList.remove('hidden');
    
    // Envanter grid oluştur
    createInventoryGrid();
    
    // Kıyafet slotlarını güncelle
    updateClothingSlots();
    
    // Ağırlık bilgisini güncelle
    updateWeightInfo();
    
    // Oyuncu bilgisini al
    fetch('https://swx_clothing/getPlayerInfo', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(data => {
        if (data) {
            document.getElementById('player-name').textContent = data.name || 'İsimsiz';
            document.getElementById('player-job').textContent = data.job || 'İşsiz';
            document.getElementById('player-id').textContent = 'ID: ' + (data.id || '-');
        }
    });
}

// Envanter kapat
function closeInventory() {
    document.getElementById('app').classList.add('hidden');
    
    // Lua'ya kapatma bildirimi gönder
    fetch('https://swx_clothing/closeInventory', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

// Envanter grid oluştur
function createInventoryGrid() {
    const grid = document.getElementById('inventory-grid');
    grid.innerHTML = '';
    
    for (let i = 1; i <= TOTAL_SLOTS; i++) {
        const slot = document.createElement('div');
        slot.className = 'inv-slot';
        slot.dataset.slot = i;
        
        // Slot numarası
        const slotNumber = document.createElement('span');
        slotNumber.className = 'slot-number';
        slotNumber.textContent = i;
        slot.appendChild(slotNumber);
        
        // İtem varsa göster
        const item = inventoryData.items[i - 1];
        if (item && item.name) {
            slot.classList.add('occupied');
            
            // İtem ikonu
            const icon = document.createElement('i');
            icon.className = 'fas item-icon ' + getItemIcon(item.name);
            slot.appendChild(icon);
            
            // İtem miktarı
            if (item.amount > 1) {
                const amount = document.createElement('span');
                amount.className = 'item-amount';
                amount.textContent = 'x' + item.amount;
                slot.appendChild(amount);
            }
            
            // İtem ismi
            const name = document.createElement('span');
            name.className = 'item-name';
            name.textContent = item.label || item.name;
            slot.appendChild(name);
            
            // Tıklama olayı
            slot.onclick = () => useItem(item, i - 1);
        }
        
        grid.appendChild(slot);
    }
}

// Kıyafet slotlarını güncelle
function updateClothingSlots() {
    const slots = document.querySelectorAll('.clothing-slot');
    
    slots.forEach(slot => {
        const slotName = slot.dataset.slot;
        const clothing = inventoryData.clothing[slotName];
        
        if (clothing) {
            slot.classList.add('has-item');
            const preview = slot.querySelector('.item-preview');
            preview.textContent = clothing.label || '';
            preview.title = clothing.label || '';
        } else {
            slot.classList.remove('has-item');
            const preview = slot.querySelector('.item-preview');
            preview.textContent = '';
        }
    });
}

// Ağırlık bilgisini güncelle
function updateWeightInfo() {
    document.getElementById('current-weight').textContent = inventoryData.weight.toFixed(1);
    document.getElementById('max-weight').textContent = inventoryData.maxWeight.toFixed(1);
    
    const percentage = (inventoryData.weight / inventoryData.maxWeight) * 100;
    document.getElementById('weight-fill').style.width = percentage + '%';
    
    // Renk değiştir (ağır ise)
    if (percentage > 90) {
        document.getElementById('weight-fill').style.background = 'linear-gradient(90deg, #ff4444, #ff8800)';
    } else if (percentage > 70) {
        document.getElementById('weight-fill').style.background = 'linear-gradient(90deg, #ff8800, #ffcc00)';
    } else {
        document.getElementById('weight-fill').style.background = 'linear-gradient(90deg, #00d4ff, #00ff88)';
    }
}

// İtem ikonu al
function getItemIcon(itemName) {
    const icons = {
        'phone': 'fa-mobile-alt',
        'water': 'fa-tint',
        'sandwich': 'fa-hamburger',
        'bandage': 'fa-band-aid',
        'money': 'fa-dollar-sign',
        'lockpick': 'fa-tools'
    };
    
    // Kıyafet itemi mi kontrol et
    if (itemName.startsWith('clothing_')) {
        const slot = itemName.replace('clothing_', '');
        const slotIcons = {
            'head': 'fa-hat-cowboy',
            'torso': 'fa-shirt',
            'undershirt': 'fa-vest',
            'legs': 'fa-socks',
            'shoes': 'fa-shoe-prints',
            'bag': 'fa-suitcase',
            'accessory': 'fa-gem',
            'mask': 'fa-mask'
        };
        return slotIcons[slot] || 'fa-tshirt';
    }
    
    return icons[itemName] || 'fa-box';
}

// İtem kullan
function useItem(item, slotIndex) {
    // Kıyafet itemi mi kontrol et
    if (item.name && item.name.startsWith('clothing_')) {
        // Giy
        fetch('https://swx_clothing/wearClothing', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ clothing: item.info })
        });
    } else {
        // Normal item kullan
        fetch('https://swx_clothing/useItem', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ slot: slotIndex })
        });
    }
}

// Kıyafet çıkar
function removeClothing(slotName) {
    fetch('https://swx_clothing/removeClothing', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ slot: slotName })
    }).then(resp => resp.json()).then(data => {
        if (data && data.success) {
            // Başarılı
            showNotification(data.message, 'success');
        } else {
            showNotification(data.message || 'Hata!', 'error');
        }
    });
}

// Oyuncu ara
function searchPlayer() {
    fetch('https://swx_clothing/searchPlayer', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

// Bildirim göster
function showNotification(message, type) {
    // Lua'ya bildirim gönder
    fetch('https://swx_clothing/showNotification', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: message, type: type })
    });
}

// Tuş olayları
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' || event.key === 'TAB') {
        closeInventory();
    }
});

// Başlangıçta gizle
document.getElementById('app').classList.add('hidden');
