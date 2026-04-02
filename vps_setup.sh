#!/bin/bash

# FiveM VPS Kurulum Script
# Bu scripti VPS'te çalıştırın

echo "==================================="
echo "FiveM VPS Kurulum Script"
echo "==================================="
echo ""

# Root kontrolü
if [ "$EUID" -ne 0 ]; then 
    echo "Bu script root olarak çalıştırılmalı (sudo kullanın)"
    exit 1
fi

# Sistem güncellemesi
echo "Sistem güncelleniyor..."
apt update && apt upgrade -y

# Gerekli paketleri kur
echo "Gerekli paketler kuruluyor..."
apt install -y git wget curl tar unzip screen mariadb-server

# MariaDB güvenlik ayarları
echo "MariaDB yapılandırılıyor..."
mysql_secure_installation

# FiveM dizini oluştur
echo "FiveM dizini oluşturuluyor..."
mkdir -p ~/fivem-server
cd ~/fivem-server

# FiveM artifacts indir
echo "FiveM server artifacts indiriliyor..."
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz
tar xf fx.tar.xz
rm fx.tar.xz

# Veritabanı bilgilerini al
echo ""
echo "==================================="
echo "Veritabanı Kurulumu"
echo "==================================="
read -p "MySQL root şifresi: " -s MYSQL_ROOT_PASS
echo ""
read -p "FiveM veritabanı kullanıcı şifresi: " -s FIVEM_DB_PASS
echo ""

# Veritabanı oluştur
echo "Veritabanı oluşturuluyor..."
mysql -u root -p${MYSQL_ROOT_PASS} <<EOF
CREATE DATABASE IF NOT EXISTS temelPaket CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'fivem'@'localhost' IDENTIFIED BY '${FIVEM_DB_PASS}';
GRANT ALL PRIVILEGES ON temelPaket.* TO 'fivem'@'localhost';
FLUSH PRIVILEGES;
EOF

# SQL dosyasını import et
if [ -f ~/temelpaket.sql ]; then
    echo "SQL dosyası import ediliyor..."
    mysql -u root -p${MYSQL_ROOT_PASS} temelPaket < ~/temelpaket.sql
    echo "SQL import tamamlandı!"
else
    echo "UYARI: temelpaket.sql dosyası bulunamadı!"
fi

# Server.cfg'yi güncelle
if [ -f ~/fivem-server/data/server.cfg ]; then
    echo "Server.cfg güncelleniyor..."
    sed -i "s|mysql://root@localhost/temelPaket|mysql://fivem:${FIVEM_DB_PASS}@localhost/temelPaket|g" ~/fivem-server/data/server.cfg
fi

# Güvenlik duvarı ayarları
echo "Güvenlik duvarı yapılandırılıyor..."
ufw allow 30120/tcp
ufw allow 30120/udp
ufw allow 22/tcp
echo "y" | ufw enable

# Başlatma scripti oluştur
echo "Başlatma scripti oluşturuluyor..."
cat > ~/fivem-server/start.sh <<'EOF'
#!/bin/bash
cd ~/fivem-server
./run.sh +exec data/server.cfg
EOF
chmod +x ~/fivem-server/start.sh

# Systemd service oluştur
echo "Systemd service oluşturuluyor..."
cat > /etc/systemd/system/fivem.service <<EOF
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
EOF

systemctl daemon-reload
systemctl enable fivem

echo ""
echo "==================================="
echo "Kurulum Tamamlandı!"
echo "==================================="
echo ""
echo "Sunucuyu başlatmak için:"
echo "  sudo systemctl start fivem"
echo ""
echo "Sunucu durumunu kontrol etmek için:"
echo "  sudo systemctl status fivem"
echo ""
echo "Logları görmek için:"
echo "  sudo journalctl -u fivem -f"
echo ""
echo "ÖNEMLI: Server.cfg dosyasında lisans anahtarınızı güncellemeyi unutmayın!"
echo "  nano ~/fivem-server/data/server.cfg"
echo ""
