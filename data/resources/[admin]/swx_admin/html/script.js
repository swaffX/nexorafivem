const app = document.getElementById('app');
const closeBtn = document.getElementById('closeBtn');
const playerList = document.getElementById('playerList');
const searchInput = document.getElementById('searchInput');
const playerModal = document.getElementById('playerModal');
const modalClose = document.getElementById('modalClose');
const modalBody = document.getElementById('modalBody');
const playerCount = document.getElementById('playerCount');

let players = [];
let filteredPlayers = [];

// Show/hide panel
function showPanel() {
    app.classList.remove('hidden');
    setTimeout(() => {
        app.classList.add('visible');
    }, 50);
    fetchPlayers();
}

function hidePanel() {
    app.classList.remove('visible');
    setTimeout(() => {
        app.classList.add('hidden');
    }, 400);
}

// Close button
closeBtn.addEventListener('click', hidePanel);

// Modal close
modalClose.addEventListener('click', hideModal);

// Close modal on backdrop click
playerModal.addEventListener('click', (e) => {
    if (e.target === playerModal) {
        hideModal();
    }
});

// Search functionality
searchInput.addEventListener('input', (e) => {
    const searchTerm = e.target.value.toLowerCase();
    filteredPlayers = players.filter(player => 
        player.name.toLowerCase().includes(searchTerm) ||
        player.id.toString().includes(searchTerm)
    );
    renderPlayers();
});

// Fetch players from server
function fetchPlayers() {
    fetch(`https://${GetParentResourceName()}/getPlayers`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        players = data;
        filteredPlayers = [...players];
        playerCount.textContent = players.length;
        renderPlayers();
    })
    .catch(error => {
        console.error('Error fetching players:', error);
    });
}

// Render player cards
function renderPlayers() {
    playerList.innerHTML = '';
    
    filteredPlayers.forEach((player, index) => {
        const card = document.createElement('div');
        card.className = 'player-card';
        card.innerHTML = `
            <div class="player-avatar">${player.name.charAt(0).toUpperCase()}</div>
            <div class="player-info">
                <div class="player-name">${player.name}</div>
                <div class="player-id">ID: ${player.id}</div>
            </div>
            <div class="player-stats">
                <div class="player-stat">
                    <span class="stat-icon">💰</span>
                    <span class="stat-value">${formatMoney(player.money)}</span>
                </div>
                <div class="player-stat">
                    <span class="stat-icon">🏦</span>
                    <span class="stat-value">${formatMoney(player.bank)}</span>
                </div>
            </div>
        `;
        
        card.addEventListener('click', () => showPlayerDetails(player));
        playerList.appendChild(card);
        
        // Staggered animation
        setTimeout(() => {
            card.classList.add('visible');
        }, index * 50);
    });
}

// Format money
function formatMoney(amount) {
    return '$' + amount.toLocaleString();
}

// Show player details modal
function showPlayerDetails(player) {
    modalBody.innerHTML = `
        <div class="detail-section">
            <h3 class="detail-title">Genel Bilgiler</h3>
            <div class="detail-grid">
                <div class="detail-item">
                    <span class="detail-label">Oyuncu ID</span>
                    <span class="detail-value">${player.id}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Oyuncu Adı</span>
                    <span class="detail-value">${player.name}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Ping</span>
                    <span class="detail-value">${player.ping}ms</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Grup</span>
                    <span class="detail-value">${player.group || 'user'}</span>
                </div>
            </div>
        </div>
        
        <div class="detail-section">
            <h3 class="detail-title">Finansal Bilgiler</h3>
            <div class="detail-grid">
                <div class="detail-item">
                    <span class="detail-label">Nakit</span>
                    <span class="detail-value highlight">${formatMoney(player.money)}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Banka</span>
                    <span class="detail-value highlight">${formatMoney(player.bank)}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Kara Para</span>
                    <span class="detail-value highlight">${formatMoney(player.blackMoney || 0)}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Toplam</span>
                    <span class="detail-value highlight">${formatMoney((player.money || 0) + (player.bank || 0) + (player.blackMoney || 0))}</span>
                </div>
            </div>
        </div>
        
        <div class="detail-section">
            <h3 class="detail-title">Oyuncu İstatistikleri</h3>
            <div class="detail-grid">
                <div class="detail-item">
                    <span class="detail-label">Job</span>
                    <span class="detail-value">${player.job || 'Job Yok'}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Job Grade</span>
                    <span class="detail-value">${player.jobGrade || 0}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Gang</span>
                    <span class="detail-value">${player.gang || 'Gang Yok'}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Gang Grade</span>
                    <span class="detail-value">${player.gangGrade || 0}</span>
                </div>
            </div>
        </div>
        
        <div class="action-buttons">
            <button class="action-btn" onclick="teleportToPlayer(${player.id})">Işınla</button>
            <button class="action-btn" onclick="bringPlayer(${player.id})">Getir</button>
            <button class="action-btn" onclick="kickPlayer(${player.id})">At</button>
            <button class="action-btn danger" onclick="banPlayer(${player.id})">Yasakla</button>
        </div>
    `;
    
    playerModal.classList.add('visible');
}

function hideModal() {
    playerModal.classList.remove('visible');
}

// Admin actions
function teleportToPlayer(playerId) {
    fetch(`https://${GetParentResourceName()}/teleportToPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ playerId })
    });
}

function bringPlayer(playerId) {
    fetch(`https://${GetParentResourceName()}/bringPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ playerId })
    });
}

function kickPlayer(playerId) {
    const reason = prompt('Sebep giriniz:');
    if (reason) {
        fetch(`https://${GetParentResourceName()}/kickPlayer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ playerId, reason })
        });
    }
}

function banPlayer(playerId) {
    const reason = prompt('Sebep giriniz:');
    if (reason) {
        fetch(`https://${GetParentResourceName()}/banPlayer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ playerId, reason })
        });
    }
}

// Listen for NUI messages
window.addEventListener('message', (event) => {
    const data = event.data;
    
    if (data.action === 'show') {
        showPanel();
    } else if (data.action === 'hide') {
        hidePanel();
    } else if (data.action === 'updatePlayers') {
        players = data.players;
        filteredPlayers = [...players];
        playerCount.textContent = players.length;
        renderPlayers();
    }
});

// Get parent resource name
function GetParentResourceName() {
    // This will be replaced by FiveM NUI
    return 'swx_admin';
}
