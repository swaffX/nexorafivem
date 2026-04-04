#!/bin/bash
# VPS Git Clean Pull Script
# Silinen dosyaları da temizler

echo "==================================="
echo "Git Clean Pull Script"
echo "==================================="

# Repo dizinine git
cd /home/fivem/data || exit

echo ""
echo "1. Mevcut değişiklikleri kontrol ediliyor..."
git status

echo ""
echo "2. Silinen dosyalar temizleniyor..."
# Silinen dosyaları git'ten kaldır
git ls-files --deleted -z | xargs -0 git rm

echo ""
echo "3. Local değişiklikler stash'leniyor..."
git stash

echo ""
echo "4. Remote'dan çekiliyor..."
git pull origin main

echo ""
echo "5. Silinen dosyalar temizleniyor (git clean)..."
# Tracked olmayan dosyaları sil
git clean -fd

echo ""
echo "6. Son durum:"
git status

echo ""
echo "==================================="
echo "✅ Tamamlandı!"
echo "==================================="
echo ""
echo "Şimdi sunucuyu restart et:"
echo "  restart qb-core"
echo "  restart qb-inventory"
echo "  restart wais-hudv6"
