# 🎯 FiveM VPS Transfer - Hızlı Başlangıç

## 🖥️ Windows'tan Transfer (3 Yöntem)

### Yöntem 1: WinSCP (En Kolay) ⭐ ÖNERİLEN

1. **WinSCP İndirin**
   - https://winscp.net/eng/download.php

2. **Bağlantı Bilgileri**
   ```
   File Protocol: SFTP
   Host name: 194.105.5.37
   Port: 22
   User name: root
   Password: developedby.swaff
   ```

3. **Dosyaları Aktarın**
   - Sol panel: `temelPaket` klasörünüzü bulun
   - Sağ panel: `/root/fivem-server/` dizinine gidin
   - Sürükle-bırak ile aktarın:
     - `data` klasörü → `/root/fivem-server/data`
     - `txData` klasörü → `/root/fivem-server/txData`
     - `temelpaket.sql` → `/root/`
     - `vps_setup.sh` → `/root/`

4. **VPS'e Bağlanın**
   - WinSCP'de üstte "Commands" → "Open in PuTTY"
   - Veya PuTTY ile: 194.105.5.37

### Yöntem 2: Git Bash (Komut Satırı)

1. **Git Bash İndirin**
   - https://git-scm.com/downloads

2. **Transfer Script Çalıştırın**
   ```bash
   cd temelPaket
   bash transfer_to_vps.sh
   ```
   
3. **Bilgileri Girin**
   - VPS IP: 194.105.5.37
   - Kullanıcı: root
   - Şifre: developedby.swaff

### Yöntem 3: PowerShell (Windows 10+)

```powershell
cd temelPaket

# Data klasörü
scp -r data root@194.105.5.37:~/fivem-server/

# txData klasörü
scp -r txData root@194.105.5.37:~/fivem-server/

# SQL dosyası
scp temelpaket.sql root@194.105.5.37:~/

# Setup script
scp vps_setup.sh root@194.105.5.37:~/
```

## 🔧 VPS Kurulumu

### 1. VPS'e Bağlanın

**PuTTY ile:**
- Host: 194.105.5.37
- Port: 22
- Username: root
- Password: developedby.swaff

**veya PowerShell/Git Bash:**
```bash
ssh root@194.105.5.37
```

### 2. Otomatik Kurulum (Önerilen)

```bash
cd ~
bash vps_setup.sh
```

Script şunları yapacak:
- ✅ Sistem güncellemesi
- ✅ Gerekli paketleri kurma
- ✅ MariaDB kurulumu
- ✅ FiveM artifacts indirme
- ✅ Veritabanı oluşturma
- ✅ SQL import
- ✅ Güvenlik duvarı ayarları
- ✅ Otomatik başlatma

### 3. Manuel Kurulum (Alternatif)

Detaylı adımlar için: `VPS_TRANSFER_GUIDE.md`

## ⚙️ Önemli Ayarlar

### Server.cfg Düzenleme

```bash
nano ~/fivem-server/data/server.cfg
```

**Değiştirilmesi Gerekenler:**

1. **Lisans Anahtarı** (Zorunlu)
   ```cfg
   sv_licenseKey "YENİ_ANAHTARINIZ"
   ```
   - https://keymaster.fivem.net adresinden alın

2. **MySQL Bağlantısı**
   ```cfg
   set mysql_connection_string "mysql://fivem:ŞİFRENİZ@localhost/temelPaket?charset=utf8mb4"
   ```

3. **Sunucu Adı**
   ```cfg
   sv_hostname "Nexora Roleplay - VPS"
   ```

Kaydet: `CTRL+O`, `Enter`, `CTRL+X`

## 🚀 Sunucuyu Başlatma

### Systemd ile (Otomatik)
```bash
systemctl start fivem
systemctl status fivem
```

### Manuel (Test için)
```bash
cd ~/fivem-server
screen -S fivem
./run.sh +exec data/server.cfg

# Çıkmak için: CTRL+A sonra D
# Geri dönmek: screen -r fivem
```

## 📊 Kontrol ve İzleme

### Sunucu Durumu
```bash
systemctl status fivem
```

### Canlı Loglar
```bash
journalctl -u fivem -f
```

### Port Kontrolü
```bash
netstat -tulpn | grep 30120
```

## 🎮 Oyundan Bağlanma

FiveM'i açın, F8'e basın:
```
connect 194.105.5.37:30120
```

## 🔄 Sunucu Yönetimi

### Başlatma
```bash
systemctl start fivem
```

### Durdurma
```bash
systemctl stop fivem
```

### Yeniden Başlatma
```bash
systemctl restart fivem
```

### Otomatik Başlatma
```bash
systemctl enable fivem
```

## 🛠️ Hızlı Komutlar

```bash
# Log görüntüleme
journalctl -u fivem -f

# Cache temizleme
rm -rf ~/fivem-server/data/cache/files/*

# Veritabanı yedeği
mysqldump -u fivem -p temelPaket > backup.sql

# Sunucu güncelleme
cd ~/fivem-server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz
systemctl stop fivem
tar xf fx.tar.xz
rm fx.tar.xz
systemctl start fivem
```

## ❓ Sorun Giderme

### Sunucu başlamıyor
```bash
# Logları kontrol et
journalctl -u fivem -n 100

# MySQL kontrol
systemctl status mysql
mysql -u fivem -p temelPaket
```

### Bağlantı sorunu
```bash
# Port kontrol
netstat -tulpn | grep 30120

# Güvenlik duvarı kontrol
ufw status
```

### Performans sorunları
```bash
# Kaynak kullanımı
htop

# Disk alanı
df -h
```

## 📋 Kontrol Listesi

- [ ] Dosyalar VPS'e aktarıldı
- [ ] VPS'e SSH ile bağlanıldı
- [ ] vps_setup.sh çalıştırıldı
- [ ] server.cfg düzenlendi (lisans anahtarı)
- [ ] MySQL şifresi ayarlandı
- [ ] Sunucu başlatıldı
- [ ] Loglar kontrol edildi
- [ ] Oyundan bağlantı test edildi

## 🎯 Özet

1. **Transfer:** WinSCP ile dosyaları aktarın
2. **Bağlan:** PuTTY ile VPS'e bağlanın
3. **Kur:** `bash vps_setup.sh` çalıştırın
4. **Ayarla:** server.cfg'de lisans anahtarını güncelleyin
5. **Başlat:** `systemctl start fivem`
6. **Test:** Oyundan bağlanın

## 📞 Yardım

Tüm komutlar: `vps_commands.txt`
Detaylı rehber: `VPS_TRANSFER_GUIDE.md`

Başarılar! 🚀
