#!/bin/bash

# FiveM Sunucu VPS Transfer Script
# Bu scripti yerel bilgisayarınızda çalıştırın

echo "==================================="
echo "FiveM VPS Transfer Script"
echo "==================================="
echo ""

# VPS bilgilerini al
read -p "VPS IP Adresi: " VPS_IP
read -p "VPS Kullanıcı Adı (root): " VPS_USER
VPS_USER=${VPS_USER:-root}

echo ""
echo "Transfer başlıyor..."
echo ""

# Data klasörünü transfer et
echo "1/3 - Data klasörü aktarılıyor..."
scp -r ./data ${VPS_USER}@${VPS_IP}:~/fivem-server/

# txData klasörünü transfer et
echo "2/3 - txData klasörü aktarılıyor..."
scp -r ./txData ${VPS_USER}@${VPS_IP}:~/fivem-server/

# SQL dosyasını transfer et
echo "3/3 - SQL dosyası aktarılıyor..."
scp ./temelpaket.sql ${VPS_USER}@${VPS_IP}:~/

echo ""
echo "==================================="
echo "Transfer tamamlandı!"
echo "==================================="
echo ""
echo "Şimdi VPS'e bağlanın ve şu adımları takip edin:"
echo "1. ssh ${VPS_USER}@${VPS_IP}"
echo "2. VPS_AKTARIM_REHBERI.md dosyasındaki adımları takip edin"
echo ""
