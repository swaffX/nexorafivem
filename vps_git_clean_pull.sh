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
echo "2. Local değişiklikler stash'leniyor..."
git stash

echo ""
echo "3. Remote'dan çekiliyor..."
git fetch origin main

echo ""
echo "4. Hard reset ile remote ile senkronize ediliyor..."
# Bu komut local'deki tüm değişiklikleri siler ve remote ile tamamen senkronize eder
git reset --hard origin/main

echo ""
echo "5. Tracked olmayan dosyalar temizleniyor..."
# Tracked olmayan dosyaları ve dizinleri sil
git clean -fd

echo ""
echo "6. Son durum:"
git status

echo ""
echo "==================================="
echo "✅ Tamamlandı!"
echo "==================================="
echo ""
echo "⚠️  NOT: Local değişiklikler stash'lendi."
echo "Geri almak için: git stash pop"
echo ""
echo "Şimdi sunucuyu restart et:"
echo "  restart qb-core"
echo "  restart qb-inventory"
echo "  restart wais-hudv6"
echo "  restart wonev-burgershot"
