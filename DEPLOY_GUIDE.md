# Nexora FiveM Sunucu Kurulum ve Deploy Rehberi

## VPS Gereksinimleri
- **OS**: Ubuntu 20.04/22.04 LTS
- **RAM**: En az 8GB (16GB önerilir)
- **CPU**: 4+ çekirdek
- **Disk**: 50GB+ SSD
- **Port**: 30120 (TCP ve UDP açık olmalı)

## VPS Kurulum Adımları

### 1. Sunucu Bağımlılıklarını Yükle
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y wget git curl mariadb-server mariadb-client
```

### 2. MariaDB Kurulumu
```bash
sudo mysql_secure_installation
sudo mysql -u root -p

# SQL komutları:
CREATE DATABASE temelpaket CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'nexora'@'localhost' IDENTIFIED BY 'GucluSifre123!';
GRANT ALL PRIVILEGES ON temelpaket.* TO 'nexora'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# SQL yedeği yükle
mysql -u nexora -p temelpaket < temelpaket.sql
```

### 3. FiveM Server Kurulumu
```bash
cd /home
mkdir fivem
cd fivem

# En son FiveM server indir
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
# Linki tarayicidan bulup asagidaki gibi devam et:
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/XXXX/fx.tar.xz
tar -xf fx.tar.xz
```

### 4. Proje Dosyalarını Aktar
```bash
# Bilgisayarindan VPS'e aktar:
scp -r c:\Users\oguz\Desktop\nexorafivem\data root@SUNUCU_IP:/home/fivem/

# Ya da VPS uzerinde direkt git clone:
cd /home/fivem
rm -rf data
wget -O data.zip "DROPBOX/DRIVE LINK"
unzip data.zip
```

### 5. Server.cfg Ayarları
Dosya: `/home/fivem/data/server.cfg`

Güncellenmesi gereken alanlar:
- `sv_licenseKey`: CFX Portal'dan alınan lisans anahtarı
- `set mysql_connection_string`: Veritabanı bağlantı bilgileri
- Admin yetkileri için Discord ID

### 6. Firewall Ayarları
```bash
sudo ufw allow 30120/tcp
sudo ufw allow 30120/udp
sudo ufw allow 22/tcp
sudo ufw enable
```

### 7. Sunucuyu Başlat
```bash
cd /home/fivem
./run.sh +exec server.cfg
```

## txAdmin Yapılandırması

Varsayılan admin: `swaffdev`
TxAdmin paneline erişim: `http://SUNUCU_IP:40120`

## CFX Lizans Anahtarı Alma
1. https://keymaster.fivem.net/ adresine git
2. "New server" butonuna tıkla
3. Sunucu IP adresini gir
4. Oluşturulan lisans anahtarını `server.cfg`'ye ekle

## Herkese Açık Sunucu İçin Ek Ayarlar

### server.cfg'de:
```
sv_maxclients 48          # Oyuncu limiti
sets tags "qbcore, tr, roleplay, turkish"  # Sunucu tagleri
sets sv_projectDesc "Açıklama"            # Sunucu açıklaması
```

### FiveM Sunucu Listesi İçin:
- OneSync: Aktif olmalı
- Server Icon: 96x96 PNG formatında

## VPS'e Aktarma - Senaryolar

### Senaryo A: SCP ile Direkt Kopyalama
```powershell
# PowerShell'den:
scp -r "c:\Users\oguz\Desktop\nexorafivem\data\*" root@SUNUCU_IP:/home/fivem/
scp "c:\Users\oguz\Desktop\nexorafivem\temelpaket.sql" root@SUNUCU_IP:/root/
```

### Senaryo B: Arşivleyip Transfer
```powershell
# PowerShell'den:
Compress-Archive -Path "c:\Users\oguz\Desktop\nexorafivem\data\*" -DestinationPath "c:\Users\oguz\Desktop\nexorafivem.zip"
scp "c:\Users\oguz\Desktop\nexorafivem.zip" root@SUNUCU_IP:/home/fivem/

# VPS'de:
ssh root@SUNUCU_IP
cd /home/fivem
unzip nexorafivem.zip
```

### Senaryo C: Git ile VPS üzerinden çek
```bash
# VPS'de:
cd /home
rm -rf fivem/data
mkdir -p fivem/data
cd fivem/data
git clone https://github.com/swaffX/nexorafivem.git temp
mv temp/data/* .
rm -rf temp
```

## Sunucu Başlatma Scripti

```bash
#!/bin/bash
cd /home/fivem
screen -S fivem -dm bash -c './run.sh +exec server.cfg'
echo "FiveM sunucu baslatildi. Kontrol icin: screen -r fivem"
```

## Güncelleme Talimatları

Resource güncelleme:
```bash
cd /home/fivem/data/resources
# Git ile yonetilen resource'lar icin:
git pull origin main
```

## Veritabanı Yedekleme

```bash
#!/bin/bash
date=$(date +%Y%m%d_%H%M%S)
mysqldump -u nexora -p'GucluSifre123!' temelpaket > /backup/temelpaket_$date.sql
```

## Bağlantı Bilgileri

Sunucu hazırlandığında şu bilgileri bana ver:
- VPS IP adresi
- SSH kullanıcı adı (root ya da kullanici)
- CFX Lizans Anahtarı (keymaster.fivem.net)
- MariaDB şifresi
- Admin olmak istediğin Discord ID

FiveM Sunucu Adresi: `connect SUNUCU_IP:30120`
