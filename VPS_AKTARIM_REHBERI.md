# FiveM Sunucu VPS Aktarım Rehberi

## 1. VPS Hazırlığı

### Linux (Ubuntu) için:
```bash
# Sistem güncellemesi
sudo apt update && sudo apt upgrade -y

# Gerekli paketler
sudo apt install -y git wget curl tar unzip

# MariaDB kurulumu
sudo apt install -y mariadb-server
sudo mysql_secure_installation

# Screen kurulumu (sunucuyu arka planda çalıştırmak için)
sudo apt install -y screen
```

### Windows Server için:
- MySQL/MariaDB indirin ve kurun
- WinSCP veya FileZilla ile dosya transferi yapın

## 2. FiveM Server Artifacts İndirme

### Linux için:
```bash
# Ana dizin oluştur
mkdir -p ~/fivem-server
cd ~/fivem-server

# FiveM server artifacts indir (güncel sürüm)
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz

# Arşivi aç
tar xf fx.tar.xz
rm fx.tar.xz
```

### Windows için:
- https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/ adresinden son sürümü indirin
- Bir klasöre çıkartın

## 3. Proje Dosyalarını VPS'e Aktarma

### Linux için (yerel bilgisayarınızdan):
```bash
# SCP ile aktarım
scp -r ./data root@VPS_IP_ADRESI:~/fivem-server/
scp -r ./txData root@VPS_IP_ADRESI:~/fivem-server/
scp temelpaket.sql root@VPS_IP_ADRESI:~/
```

### Alternatif: SFTP/FTP kullanarak:
- FileZilla veya WinSCP ile bağlanın
- `data` ve `txData` klasörlerini VPS'e yükleyin

## 4. Veritabanı Kurulumu

```bash
# MySQL'e giriş
sudo mysql -u root -p

# Veritabanı oluştur
CREATE DATABASE temelPaket CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# Kullanıcı oluştur (güvenli şifre kullanın!)
CREATE USER 'fivem'@'localhost' IDENTIFIED BY 'GÜÇLÜ_ŞİFRE_BURAYA';
GRANT ALL PRIVILEGES ON temelPaket.* TO 'fivem'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# SQL dosyasını import et
sudo mysql -u root -p temelPaket < ~/temelpaket.sql
```

## 5. Server.cfg Düzenleme

VPS'te server.cfg dosyasını düzenleyin:

```bash
nano ~/fivem-server/data/server.cfg
```

Değiştirilmesi gerekenler:
- `endpoint_add_tcp` ve `endpoint_add_udp` - VPS IP adresinizi kullanın veya 0.0.0.0 bırakın
- `sv_licenseKey` - Kendi lisans anahtarınızı kullanın (https://keymaster.fivem.net)
- `mysql_connection_string` - Veritabanı bilgilerini güncelleyin:
  ```
  set mysql_connection_string "mysql://fivem:GÜÇLÜ_ŞİFRE_BURAYA@localhost/temelPaket?charset=utf8mb4"
  ```

## 6. Güvenlik Duvarı Ayarları

### Linux (UFW):
```bash
sudo ufw allow 30120/tcp
sudo ufw allow 30120/udp
sudo ufw allow 22/tcp  # SSH için
sudo ufw enable
```

### Windows:
- Windows Firewall'da 30120 TCP ve UDP portlarını açın

## 7. Sunucuyu Başlatma

### Linux için:
```bash
cd ~/fivem-server
screen -S fivem
bash -c 'cd ~/fivem-server && ./run.sh +exec data/server.cfg'

# Screen'den çıkmak için: CTRL+A sonra D
# Screen'e geri dönmek için: screen -r fivem
```

### Başlatma scripti oluşturma:
```bash
nano ~/fivem-server/start.sh
```

İçeriği:
```bash
#!/bin/bash
cd ~/fivem-server
./run.sh +exec data/server.cfg
```

Çalıştırılabilir yap:
```bash
chmod +x ~/fivem-server/start.sh
```

## 8. Otomatik Başlatma (Systemd Service)

```bash
sudo nano /etc/systemd/system/fivem.service
```

İçerik:
```ini
[Unit]
Description=FiveM Server
After=network.target

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

Servisi etkinleştir:
```bash
sudo systemctl daemon-reload
sudo systemctl enable fivem
sudo systemctl start fivem
sudo systemctl status fivem
```

## 9. Log Kontrolü

```bash
# Systemd ile çalışıyorsa
sudo journalctl -u fivem -f

# Screen ile çalışıyorsa
screen -r fivem
```

## 10. Sunucuya Bağlanma

FiveM'i açın ve F8'e basarak konsolu açın:
```
connect VPS_IP_ADRESI:30120
```

## Sorun Giderme

### Sunucu başlamıyorsa:
1. Log dosyalarını kontrol edin
2. MySQL bağlantısını test edin
3. Portların açık olduğundan emin olun
4. Lisans anahtarının geçerli olduğunu kontrol edin

### MySQL bağlantı hatası:
```bash
# MySQL'in çalıştığını kontrol et
sudo systemctl status mysql

# Bağlantıyı test et
mysql -u fivem -p temelPaket
```

### Port kontrolü:
```bash
sudo netstat -tulpn | grep 30120
```

## Performans İyileştirmeleri

1. MySQL optimizasyonu için my.cnf düzenleyin
2. Gereksiz kaynakları devre dışı bırakın
3. OneSync kullanın (server.cfg'de)
4. Düzenli yedekleme yapın

## Yedekleme

```bash
# Veritabanı yedeği
mysqldump -u fivem -p temelPaket > backup_$(date +%Y%m%d).sql

# Dosya yedeği
tar -czf fivem_backup_$(date +%Y%m%d).tar.gz ~/fivem-server/data
```

## Güvenlik Önerileri

1. Root kullanıcısı yerine ayrı bir kullanıcı oluşturun
2. SSH için key-based authentication kullanın
3. Fail2ban kurun
4. Düzenli güncellemeler yapın
5. Güçlü veritabanı şifreleri kullanın
