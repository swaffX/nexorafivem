// SWX Admin Panel - JavaScript

const adminPanel = document.getElementById('admin-panel');
const playerList = document.getElementById('player-list');
const playerCount = document.getElementById('player-count');
const refreshBtn = document.getElementById('refresh-btn');
const closeBtn = document.getElementById('close-btn');
const playerModal = document.getElementById('player-modal');
const modalCloseBtn = document.getElementById('modal-close-btn');
const modalPlayerName = document.getElementById('modal-player-name');
const modalBody = document.getElementById('modal-body');

let players = [];

// NUI mesajlarını dinle
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'open':
            adminPanel.classList.add('visible');
            break;
        case 'close':
            adminPanel.classList.remove('visible');
            break;
        case 'updatePlayers':
            players = data.players;
            updatePlayerList();
            break;
        case 'showPlayerDetails':
            showPlayerDetails(data.playerDetails);
            break;
    }
});

// Paneli kapat
closeBtn.addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});

// Oyuncu listesini yenile
refreshBtn.addEventListener('click', function() {
    refreshBtn.style.transform = 'rotate(360deg)';
    setTimeout(() => {
        refreshBtn.style.transform = 'rotate(0deg)';
    }, 500);
    
    fetch(`https://${GetParentResourceName()}/refreshPlayers`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});

// Modal'ı kapat
modalCloseBtn.addEventListener('click', function() {
    playerModal.classList.remove('visible');
});

playerModal.addEventListener('click', function(e) {
    if (e.target === playerModal) {
        playerModal.classList.remove('visible');
    }
});

// Oyuncu listesini güncelle
function updatePlayerList() {
    playerList.innerHTML = '';
    playerCount.textContent = players.length;
    
    players.forEach((player, index) => {
        const playerItem = document.createElement('div');
        playerItem.className = 'player-item';
        playerItem.style.animationDelay = `${index * 0.05}s`;
        
        const pingClass = player.ping < 50 ? 'low' : player.ping < 100 ? 'medium' : 'high';
        
        playerItem.innerHTML = `
            <div class="player-id">#${player.id}</div>
            <div class="player-name">${player.name}</div>
            <div class="player-job">${player.job} - ${player.grade}</div>
            <div class="player-money">$${formatMoney(player.cash + player.bank)}</div>
            <div class="player-ping ${pingClass}">${player.ping}ms</div>
        `;
        
        playerItem.addEventListener('click', function() {
            fetch(`https://${GetParentResourceName()}/getPlayerDetails`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    playerId: player.id
                })
            });
        });
        
        playerList.appendChild(playerItem);
    });
}

// Oyuncu detaylarını göster
function showPlayerDetails(playerDetails) {
    if (!playerDetails) return;
    
    modalPlayerName.textContent = playerDetails.name.toUpperCase();
    
    const pingClass = playerDetails.ping < 50 ? 'low' : playerDetails.ping < 100 ? 'medium' : 'high';
    
    modalBody.innerHTML = `
        <div class="detail-item">
            <span class="detail-label">ID</span>
            <span class="detail-value">#${playerDetails.id}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">İsim</span>
            <span class="detail-value">${playerDetails.name}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Nakit</span>
            <span class="detail-value money">$${formatMoney(playerDetails.cash)}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Banka</span>
            <span class="detail-value money">$${formatMoney(playerDetails.bank)}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Toplam</span>
            <span class="detail-value money">$${formatMoney(playerDetails.cash + playerDetails.bank)}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">İş</span>
            <span class="detail-value">${playerDetails.job} - ${playerDetails.grade}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Ping</span>
            <span class="detail-value ping ${pingClass}">${playerDetails.ping}ms</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Citizen ID</span>
            <span class="detail-value">${playerDetails.citizenid || 'N/A'}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">License</span>
            <span class="detail-value">${playerDetails.license || 'N/A'}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Steam</span>
            <span class="detail-value">${playerDetails.steam || 'N/A'}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Konum</span>
            <span class="detail-value">X: ${playerDetails.coords.x.toFixed(2)}, Y: ${playerDetails.coords.y.toFixed(2)}, Z: ${playerDetails.coords.z.toFixed(2)}</span>
        </div>
    `;
    
    playerModal.classList.add('visible');
}

// Para formatı
function formatMoney(amount) {
    return amount.toLocaleString('tr-TR');
}

// ESC tuşu ile paneli kapat
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        if (playerModal.classList.contains('visible')) {
            playerModal.classList.remove('visible');
        }
    }
});
