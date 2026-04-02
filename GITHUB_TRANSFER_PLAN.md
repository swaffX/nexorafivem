# 🔐 GitHub ile Güvenli Transfer Planı

## 📋 Dosya Ayrımı

### ✅ GitHub'a Yüklenecekler (Güvenli)
```
temelPaket/
├── data/
│   └── resources/          ← Tüm scriptler
├── vps_setup.sh           ← Kurulum scripti
├── .gitignore             ← Güvenlik dosyası
├── HIZLI_BASLANGIC.txt
├── VPS_TRANSFER_GUIDE.md
├── BASLATMA_REHBERI.md
├── vps_commands.txt
├── HATA_COZUMLERI.md
├── SILAH_VERME_REHBERI.md
└── README.md
```

### 🚫 GitHub'a Yüklenmeyecekler (Manuel)
```
❌ data/server.cfg          ← Lisans anahtarı var
❌ data/server.cfg.bkp      ← Yedek config
❌ data/cache/              ← Gereksiz, büyük
❌ temelpaket.sql           ← Veritabanı
❌ txData/                  ← CFX data (büyük)
❌ artifacts/               ← Binary dosyalar
```

---

## 🎯 Adım Adım Plan

### 1️⃣ GitHub Repo Oluşturma

```bash
cd temelPaket

# Git başlat
git init

# .gitignore ekle (zaten hazır)
git add .gitignore

# İlk commit
git add .
git commit -m "Initial commit - FiveM server files"

# GitHub'a bağla (private repo oluşturun!)
git remote add origin https://github.com/KULLANICI_ADINIZ/fivem-server.git
git branch -M main
git push -u origin main
```

### 2️⃣ VPS'te GitHub'dan Çekme

```bash
# VPS'e bağlan
ssh root@194.105.5.37

# FiveM dizini oluştur
mkdir -p ~/fivem-server
cd ~/fivem-server

# GitHub'dan çek
git clone https://github.com/KULLANICI_ADINIZ/fivem-server.git .

# Veya private repo için token ile:
git clone https://GITHUB_TOKEN@github.com/KULLANICI_ADINIZ/fivem-server.git .
```

### 3️⃣ Manuel Dosya Transferi (Hassas Dosyalar)

**Yerel bilgisayarınızda (PowerShell):**
```powershell
cd temelPaket

# Server.cfg
scp data/server.cfg root@194.105.5.37:~/fivem-server/data/

# SQL dosyası
scp temelpaket.sql root@194.105.5.37:~/

# txData (opsiyonel, VPS'te oluşturulabilir)
scp -r txData root@194.105.5.37:~/fivem-server/
```

### 4️⃣ VPS'te Eksik Dosyaları Oluşturma

```bash
# VPS'te
cd ~/fivem-server

# txData klasörü (eğer aktarmadıysanız)
mkdir -p txData

# Cache klasörü
mkdir -p data/cache/files

# FiveM artifacts indir
cd ~/fivem-server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz
tar xf fx.tar.xz
rm fx.tar.xz
```

---

## 🔧 Güvenli server.cfg Şablonu

VPS'te server.cfg'yi düzenlerken:

```bash
nano ~/fivem-server/data/server.cfg
```

Değiştirilecekler:
```cfg
# Lisans (keymaster.fivem.net'ten alın)
sv_licenseKey "YENİ_ANAHTARINIZ"

# MySQL (VPS'te kurulacak)
set mysql_connection_string "mysql://fivem:GÜVENLİ_ŞİFRE@localhost/temelPaket?charset=utf8mb4"

# IP (0.0.0.0 bırakın)
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"
```

---

## 📦 Güncelleme Senaryosu

### Yerel Değişiklik Yaptınızda:

```bash
cd temelPaket

# Değişiklikleri ekle
git add .
git commit -m "Updated resources"
git push
```

### VPS'te Güncelleme:

```bash
ssh root@194.105.5.37
cd ~/fivem-server

# Sunucuyu durdur
systemctl stop fivem

# Güncellemeleri çek
git pull

# Sunucuyu başlat
systemctl start fivem
```

---

## 🎬 Hızlı Başlangıç Komutları

### Yerel (İlk Kez):
```bash
cd temelPaket
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/KULLANICI_ADINIZ/fivem-server.git
git push -u origin main
```

### VPS (İlk Kez):
```bash
ssh root@194.105.5.37

# GitHub'dan çek
cd ~
git clone https://github.com/KULLANICI_ADINIZ/fivem-server.git fivem-server

# Manuel dosyaları aktar (başka terminal)
# scp data/server.cfg root@194.105.5.37:~/fivem-server/data/
# scp temelpaket.sql root@194.105.5.37:~/

# Kuruluma başla
cd ~/fivem-server
bash vps_setup.sh
```

---

## ✅ Kontrol Listesi

### GitHub'a Yüklemeden Önce:
- [ ] `.gitignore` dosyası oluşturuldu
- [ ] `server.cfg` içinde lisans anahtarı yok
- [ ] `.sql` dosyası ignore edildi
- [ ] Private repo oluşturuldu

### VPS'te:
- [ ] GitHub'dan dosyalar çekildi
- [ ] `server.cfg` manuel aktarıldı
- [ ] `temelpaket.sql` manuel aktarıldı
- [ ] FiveM artifacts indirildi
- [ ] MySQL kuruldu ve yapılandırıldı

---

## 🔒 Güvenlik İpuçları

1. **Private Repo Kullanın:** GitHub'da mutlaka private repo oluşturun
2. **Token Kullanın:** Şifre yerine Personal Access Token kullanın
3. **2FA Aktif:** GitHub hesabınızda 2FA açın
4. **Commit Geçmişi:** Hassas bilgi commit'lemeyin (geçmişte kalır)
5. **Secrets:** GitHub Actions kullanıyorsanız secrets kullanın

---

## 💡 Bonus: GitHub Actions ile Otomatik Deploy

`.github/workflows/deploy.yml` oluşturun:
```yaml
name: Deploy to VPS

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Deploy to VPS
        uses: appleboy/ssh-action@master
        with:
          host: 194.105.5.37
          username: root
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          script: |
            cd ~/fivem-server
            git pull
            systemctl restart fivem
```

---

## 📞 Yardım

Sorun yaşarsanız:
- Git hatası: `git status` ile kontrol edin
- Push sorunu: Token veya SSH key kontrol edin
- VPS'te pull sorunu: `git reset --hard origin/main`

Başarılar! 🚀
