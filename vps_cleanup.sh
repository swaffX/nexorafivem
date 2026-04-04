#!/bin/bash

# =====================================================
# VPS Temizleme Scripti
# Nexora FiveM Server - Manuel Silme İşlemleri
# =====================================================

echo "=========================================="
echo "  NEXORA FIVEM - VPS TEMİZLEME SCRİPTİ"
echo "=========================================="
echo ""

# Renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Sunucu dizini
SERVER_DIR="/home/fivem/data"

echo -e "${YELLOW}Sunucu dizini: ${SERVER_DIR}${NC}"
echo ""

# Silme fonksiyonu
remove_if_exists() {
    local path="$1"
    local full_path="${SERVER_DIR}/${path}"
    
    if [ -e "$full_path" ]; then
        echo -e "${RED}[SİLİNİYOR]${NC} $path"
        rm -rf "$full_path"
        echo -e "${GREEN}[✓] Silindi${NC}"
    else
        echo -e "${YELLOW}[ATLA]${NC} $path (zaten yok)"
    fi
}

echo "=========================================="
echo "  SİLİNECEK DOSYALAR VE KLASÖRLER"
echo "=========================================="
echo ""

# qb-inventory (ox_inventory ile değiştirildi)
echo -e "${YELLOW}1. qb-inventory kaldırılıyor...${NC}"
remove_if_exists "resources/[qb]/qb-inventory"
echo ""

# qb-shops (ox_inventory shops ile değiştirildi)
echo -e "${YELLOW}2. qb-shops kaldırılıyor...${NC}"
remove_if_exists "resources/[qb]/qb-shops"
echo ""

# 0r-mechanic (qb-customs ile değiştirildi)
echo -e "${YELLOW}3. 0r-mechanic kaldırılıyor...${NC}"
remove_if_exists "resources/[meslek]/[legal]/0r-mechanic"
echo ""

# simple-mechanic (qb-customs ile değiştirildi)
echo -e "${YELLOW}4. simple-mechanic kaldırılıyor...${NC}"
remove_if_exists "resources/[meslek]/[legal]/simple-mechanic"
echo ""

# Eski WAIS-HUD dosyaları (yeniden eklendi)
echo -e "${YELLOW}5. Eski WAIS-HUD dosyaları temizleniyor...${NC}"
remove_if_exists "resources/[standalone]/wais-hudv6/web/public/logo_remover.js"
remove_if_exists "resources/[standalone]/wais-hudv6/client/money_sync.lua"
echo ""

# qb-inventory bridge (artık qb-ox_inventory var)
echo -e "${YELLOW}6. Eski qb-inventory bridge temizleniyor...${NC}"
remove_if_exists "resources/[qb]/qb-inventory/client/hud_bridge.lua"
echo ""

echo "=========================================="
echo "  GİT PULL İŞLEMİ"
echo "=========================================="
echo ""

cd "$SERVER_DIR" || exit

echo -e "${YELLOW}Git durumu kontrol ediliyor...${NC}"
git status

echo ""
echo -e "${YELLOW}Git pull yapılıyor...${NC}"
git pull

echo ""
echo "=========================================="
echo "  TEMİZLEME TAMAMLANDI"
echo "=========================================="
echo ""
echo -e "${GREEN}✓ Tüm gereksiz dosyalar silindi${NC}"
echo -e "${GREEN}✓ Git pull tamamlandı${NC}"
echo ""
echo -e "${YELLOW}Sunucuyu restart etmeyi unutma!${NC}"
echo ""
