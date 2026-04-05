# SWX YouTube Audio Extractor

## Kurulum (VPS'te)

### 1. yt-dlp Kurulumu
```bash
# Linux (Ubuntu/Debian)
sudo apt update
sudo apt install -y python3-pip
sudo pip3 install yt-dlp

# Veya
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

### 2. Node.js Bağımlılıkları
```bash
cd /path/to/swx_youtube_extractor
npm install
```

### 3. Servisi Başlat
```bash
npm start
```

Veya background'da:
```bash
nohup npm start > extractor.log 2>&1 &
```

### 4. Test
```bash
curl http://localhost:3000/health
curl "http://localhost:3000/extract?url=https://www.youtube.com/watch?v=VIDEO_ID"
```

## FiveM Entegrasyonu

server.lua dosyasında kendi extractor'ını kullan:
```lua
local extractorUrl = 'http://localhost:3000/extract'
```

## Port
Default: 3000

## Firewall
Port 3000'i aç (sadece localhost yeterli):
```bash
# Sadece local kullanım için (önerilen)
# Hiçbir şey yapma, zaten localhost'ta çalışıyor
```
