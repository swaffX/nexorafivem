#!/bin/bash

# Hızlı VPS Transfer Script
# Özel: 194.105.5.37

VPS_IP="194.105.5.37"
VPS_USER="root"

echo "==================================="
echo "FiveM VPS Hızlı Transfer"
echo "==================================="
echo "VPS: ${VPS_IP}"
echo "Kullanıcı: ${VPS_USER}"
echo ""
echo "Transfer başlıyor..."
echo ""

# Data klasörü
echo "[1/4] Data klasörü aktarılıyor..."
scp -r ./data ${VPS_USER}@${VPS_IP}:~/fivem-server/ || {
    echo "HATA: Data klasörü aktarılamadı!"
    exit 1
}

# txData klasörü
echo "[2/4] txData klasörü aktarılıyor..."
scp -r ./txData ${VPS_USER}@${VPS_IP}:~/fivem-server/ || {
    echo "HATA: txData klasörü aktarılamadı!"
    exit 1
}

# SQL dosyası
echo "[3/4] SQL dosyası aktarılıyor..."
scp ./temelpaket.sql ${VPS_USER}@${VPS_IP}:~/ || {
    echo "HATA: SQL dosyası aktarılamadı!"
    exit 1
}

# Setup script
echo "[4/4] Setup script aktarılıyor..."
scp ./vps_setup.sh ${VPS_USER}@${VPS_IP}:~/ || {
    echo "HATA: Setup script aktarılamadı!"
    exit 1
}

echo ""
echo "==================================="
echo "✅ Transfer Tamamlandı!"
echo "==================================="
echo ""
echo "Şimdi VPS'e bağlanın:"
echo "  ssh ${VPS_USER}@${VPS_IP}"
echo ""
echo "VPS'te kurulum için:"
echo "  bash ~/vps_setup.sh"
echo ""
echo "Detaylı rehber: VPS_TRANSFER_GUIDE.md"
echo ""
