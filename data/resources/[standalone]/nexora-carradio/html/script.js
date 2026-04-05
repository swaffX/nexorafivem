let playlist = [];

window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'toggle') {
        const container = document.getElementById('container');
        container.style.display = data.show ? 'flex' : 'none';
        
        if (data.show && data.data) {
            // Ayarları yükle
            document.getElementById('volumeSlider').value = data.data.volume * 100;
            document.getElementById('volumeValue').textContent = Math.round(data.data.volume * 100);
            
            document.getElementById('bassSlider').value = data.data.bass;
            document.getElementById('bassValue').textContent = data.data.bass;
            
            document.getElementById('trebleSlider').value = data.data.treble;
            document.getElementById('trebleValue').textContent = data.data.treble;
            
            // Playlist'i yükle
            if (data.data.playlist) {
                playlist = data.data.playlist;
                updatePlaylist();
            }
        }
    }
});

// ESC tuşu ile kapat
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeMenu();
    }
});

function closeMenu() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function playMusic() {
    const url = document.getElementById('musicUrl').value;
    
    if (!url) {
        return;
    }
    
    fetch(`https://${GetParentResourceName()}/playMusic`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url: url, title: extractTitle(url) })
    }).then(resp => resp.json()).then(data => {
        if (data.success) {
            playlist.push({ url: url, title: extractTitle(url) });
            updatePlaylist();
            document.getElementById('musicUrl').value = '';
        }
    });
}

function stopMusic() {
    fetch(`https://${GetParentResourceName()}/stopMusic`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function pauseMusic() {
    fetch(`https://${GetParentResourceName()}/pauseMusic`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function resumeMusic() {
    fetch(`https://${GetParentResourceName()}/resumeMusic`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function changeVolume(value) {
    document.getElementById('volumeValue').textContent = value;
    
    fetch(`https://${GetParentResourceName()}/setVolume`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ volume: value / 100 })
    });
}

function changeBass(value) {
    document.getElementById('bassValue').textContent = value;
    
    fetch(`https://${GetParentResourceName()}/setBass`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ bass: parseInt(value) })
    });
}

function changeTreble(value) {
    document.getElementById('trebleValue').textContent = value;
    
    fetch(`https://${GetParentResourceName()}/setTreble`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ treble: parseInt(value) })
    });
}

function clearPlaylist() {
    playlist = [];
    updatePlaylist();
    
    fetch(`https://${GetParentResourceName()}/clearPlaylist`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function updatePlaylist() {
    const playlistDiv = document.getElementById('playlist');
    
    if (playlist.length === 0) {
        playlistDiv.innerHTML = '<p class="empty-playlist">Henüz şarkı çalmadınız</p>';
        return;
    }
    
    playlistDiv.innerHTML = '';
    
    // Son 10 şarkıyı göster
    const recentSongs = playlist.slice(-10).reverse();
    
    recentSongs.forEach(song => {
        const item = document.createElement('div');
        item.className = 'playlist-item';
        item.textContent = song.title;
        item.onclick = () => {
            document.getElementById('musicUrl').value = song.url;
        };
        playlistDiv.appendChild(item);
    });
}

function extractTitle(url) {
    // YouTube URL'sinden başlık çıkar (basit versiyon)
    const match = url.match(/[?&]v=([^&]+)/);
    if (match) {
        return 'YouTube - ' + match[1];
    }
    return 'Bilinmeyen Şarkı';
}

function GetParentResourceName() {
    return window.location.hostname === '' ? 'nexora-carradio' : window.location.hostname;
}
