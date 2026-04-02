# 🚀 FiveM Sunucu VPS Transfer Rehberi

## 📋 VPS Bilgileriniz
- IP: 194.105.5.37
- Kullanıcı: root
- Port: 30120

## ⚡ Hızlı Başlangıç (3 Adım)

### Adım 1: Yerel Bilgisayarınızda (Windows)
```bash
# PowerShell veya Git Bash'te çalıştırın
cd temelPaket
bash transfer_to_vps.sh
```
VPS bilgilerini girin:
- IP: 194.105.5.37
- Kullanıcı: root

### Adım 2: VPS'e Bağlanın
```bash
ssh root@194.105.5.37
```

### Adım 3: VPS'te Kurulum
```bash
cd ~
bash vps_setup.sh
```

## 📝 Detaylı Adımlar

### 1️⃣ Dosya Transferi (Yerel Bilgisayar)

#### Yöntem A: SCP ile (Önerilen)
```bash
# Git Bash veya PowerShell'de
cd temelPaket

# Data klasörü
scp -r data root@194.105.5.37:~/fivem-server/

# txData klasörü  
scp -r txData root@194.105.5.37:~/fivem-server/

# SQL dosyası
scp temelpaket.sql root@194.105.5.37:~/

# Artifacts klasörü (opsiyonel, VPS'te indirebilirsiniz)
scp -r artifacts root@194.105.5.37:~/fivem-server/
```

#### Yöntem B: WinSCP ile (GUI)
1. WinSCP'yi açın
2. Bağlantı bilgileri:
   - Host: 194.105.5.37
   - User: root
   - Password: developedby.swaff
3. Şu klasörleri sürükle-bırak ile aktarın:
   - `data` → `/root/fivem-server/data`
   - `txData` → `/root/fivem-server/txData`
   - `temelpaket.sql` → `/root/`

### 2️⃣ VPS'e Bağlanma

```bash
ssh root@194.105.5.37
# Şifre: developedby.swaff
```

### 3️⃣ VPS Kurulumu

```bash
# Sistem güncelleme
apt update && apt upgrade -y

# Gerekli paketler
apt install -y git wget curl tar unzip screen mariadb-server

# FiveM dizini oluştur
mkdir -p ~/fivem-server
cd ~/fivem-server

# FiveM artifacts indir
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz
tar xf fx.tar.xz
rm fx.tar.xz
```

### 4️⃣ Veritabanı Kurulumu

```bash
# MariaDB güvenlik ayarları
mysql_secure_installation
# Root şifresi belirleyin (örn: FiveM2024!)

# Veritabanı oluştur
mysql -u root -p
```

MySQL konsolunda:
```sql
CREATE DATABASE temelPaket CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'fivem'@'localhost' IDENTIFIED BY 'FiveM2024!';
GRANT ALL PRIVILEGES ON temelPaket.* TO 'fivem'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

SQL dosyasını import et:
```bash
mysql -u root -p temelPaket < ~/temelpaket.sql
```

### 5️⃣ Server.cfg Düzenleme

```bash
nano ~/fivem-server/data/server.cfg
```

Değiştirilecekler:
```cfg
# IP ayarı (0.0.0.0 bırakın)
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# Lisans anahtarı (https://keymaster.fivem.net)
sv_licenseKey "YENİ_LİSANS_ANAHTARINIZ"

# MySQL bağlantısı
set mysql_connection_string "mysql://fivem:FiveM2024!@localhost/temelPaket?charset=utf8mb4"

# Sunucu adı
sv_hostname "Nexora Roleplay - VPS"
```

Kaydet: CTRL+O, Enter, CTRL+X

### 6️⃣ Güvenlik Duvarı

```bash
ufw allow 30120/tcp
ufw allow 30120/udp
ufw allow 22/tcp
ufw enable
```

### 7️⃣ Sunucuyu Başlatma

#### Test Başlatma (Manuel)
```bash
cd ~/fivem-server
screen -S fivem
./run.sh +exec data/server.cfg

# Screen'den çıkmak: CTRL+A sonra D
# Geri dönmek: screen -r fivem
```

#### Otomatik Başlatma (Systemd)
```bash
nano /etc/systemd/system/fivem.service
```

İçerik:
```ini
[Unit]
Description=FiveM Server
After=network.target mysql.service

[Service]
Type=simple
User=root
WorkingDirectory=/root/fivem-server
ExecStart=/root/fivem-server/run.sh +exec data/server.cfg
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Servisi başlat:
```bash
systemctl daemon-reload
systemctl enable fivem
systemctl start fivem
systemctl status fivem
```

### 8️⃣ Log Kontrolü

```bash
# Systemd logları
journalctl -u fivem -f

# veya Screen ile
screen -r fivem
```

### 9️⃣ Sunucuya Bağlanma

FiveM'de F8 konsolu:
```
connect 194.105.5.37:30120
```

## 🔧 Sorun Giderme

### Sunucu başlamıyor
```bash
# Log kontrol
journalctl -u fivem -n 100

# Port kontrol
netstat -tulpn | grep 30120

# MySQL kontrol
systemctl status mysql
mysql -u fivem -p temelPaket
```

### Cache temizleme
```bash
cd ~/fivem-server/data
rm -rf cache/files/*
```

### Sunucuyu yeniden başlatma
```bash
systemctl restart fivem
```

### Sunucuyu durdurma
```bash
systemctl stop fivem
```

## 📊 Performans İzleme

```bash
# CPU ve RAM kullanımı
htop

# Disk kullanımı
df -h

# Sunucu durumu
systemctl status fivem
```

## 💾 Yedekleme

```bash
# Veritabanı yedeği
mysqldump -u fivem -p temelPaket > backup_$(date +%Y%m%d).sql

# Dosya yedeği
tar -czf fivem_backup_$(date +%Y%m%d).tar.gz ~/fivem-server/data
```

## 🎯 Kontrol Listesi

- [ ] Dosyalar VPS'e aktarıldı
- [ ] FiveM artifacts indirildi
- [ ] MariaDB kuruldu ve yapılandırıldı
- [ ] SQL dosyası import edildi
- [ ] server.cfg düzenlendi (lisans, MySQL)
- [ ] Güvenlik duvarı ayarlandı
- [ ] Sunucu başlatıldı
- [ ] Oyundan bağlantı test edildi
- [ ] Otomatik başlatma ayarlandı
- [ ] Yedekleme planı yapıldı

## 📞 Yardım

Sorun yaşarsanız:
1. Logları kontrol edin: `journalctl -u fivem -n 100`
2. MySQL bağlantısını test edin
3. Portların açık olduğunu kontrol edin
4. Lisans anahtarının geçerli olduğunu kontrol edin

## 🚀 Başarılı Transfer!

Sunucunuz şu adreste çalışıyor olmalı:
```
194.105.5.37:30120
```

İyi oyunlar! 🎮
