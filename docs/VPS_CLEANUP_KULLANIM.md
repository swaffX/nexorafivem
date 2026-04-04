# VPS CLEANUP KULLANIM REHBERİ

## 🤔 Sorun Nedir?

Git'te dosya sildiğinizde ve push yaptığınızda, VPS'de `git pull` yaptığınızda silinen dosyalar **otomatik olarak silinmez**. 

**Neden?**
- `git pull` sadece değişiklikleri çeker
- Silinen dosyaları silmez
- Bu yüzden eski dosyalar VPS'de kalır

**Örnek:**
```bash
# Local'de:
rm -rf data/resources/[qb]/qb-inventory
git add .
git commit -m "qb-inventory silindi"
git push

# VPS'de:
git pull
# qb-inventory HALA DURUYOR! ❌
```

---

## ✅ Çözüm: Cleanup Script

İki script oluşturduk:
1. **vps_cleanup.sh** - Linux/VPS için
2. **vps_cleanup.bat** - Windows için (test amaçlı)

---

## 🐧 Linux/VPS Kullanımı

### 1. Script'i VPS'e Yükle

**Yöntem 1: Git ile (Önerilen)**
```bash
cd /home/fivem/data
git pull
chmod +x vps_cleanup.sh
```

**Yöntem 2: Manuel Kopyala**
```bash
# Local'den VPS'e kopyala:
scp vps_cleanup.sh root@194.105.5.37:/home/fivem/data/

# VPS'de çalıştırılabilir yap:
chmod +x /home/fivem/data/vps_cleanup.sh
```

### 2. Script'i Çalıştır

```bash
cd /home/fivem/data
./vps_cleanup.sh
```

### 3. Çıktı Örneği

```
==========================================
  NEXORA FIVEM - VPS TEMİZLEME SCRİPTİ
==========================================

Sunucu dizini: /home/fivem/data

==========================================
  SİLİNECEK DOSYALAR VE KLASÖRLER
==========================================

1. qb-inventory kaldırılıyor...
[SİLİNİYOR] resources/[qb]/qb-inventory
[✓] Silindi

2. qb-shops kaldırılıyor...
[SİLİNİYOR] resources/[qb]/qb-shops
[✓] Silindi

3. 0r-mechanic kaldırılıyor...
[ATLA] resources/[meslek]/[legal]/0r-mechanic (zaten yok)

4. simple-mechanic kaldırılıyor...
[ATLA] resources/[meslek]/[legal]/simple-mechanic (zaten yok)

5. Eski WAIS-HUD dosyaları temizleniyor...
[SİLİNİYOR] resources/[standalone]/wais-hudv6/web/public/logo_remover.js
[✓] Silindi

6. Eski qb-inventory bridge temizleniyor...
[ATLA] resources/[qb]/qb-inventory/client/hud_bridge.lua (zaten yok)

==========================================
  GİT PULL İŞLEMİ
==========================================

Git durumu kontrol ediliyor...
On branch main
Your branch is behind 'origin/main' by 5 commits.

Git pull yapılıyor...
Updating abc1234..def5678
Fast-forward
 data/server.cfg | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

==========================================
  TEMİZLEME TAMAMLANDI
==========================================

✓ Tüm gereksiz dosyalar silindi
✓ Git pull tamamlandı

Sunucuyu restart etmeyi unutma!
```

---

## 🪟 Windows Kullanımı (Test Amaçlı)

### 1. Script'i Çalıştır

```cmd
cd C:\Users\zeyne\OneDrive\Masaüstü\nexorafivem
vps_cleanup.bat
```

### 2. Server Dizinini Düzenle

Script'in içindeki bu satırı düzenle:
```batch
set SERVER_DIR=C:\FXServer\server-data
```

Senin dizinine göre:
```batch
set SERVER_DIR=C:\Users\zeyne\OneDrive\Masaüstü\nexorafivem\data
```

---

## 📋 Script Ne Siliyor?

### 1. qb-inventory
**Neden:** ox_inventory ile değiştirildi
```
resources/[qb]/qb-inventory/
```

### 2. qb-shops
**Neden:** ox_inventory shops ile değiştirildi
```
resources/[qb]/qb-shops/
```

### 3. 0r-mechanic
**Neden:** qb-customs ile değiştirildi
```
resources/[meslek]/[legal]/0r-mechanic/
```

### 4. simple-mechanic
**Neden:** qb-customs ile değiştirildi
```
resources/[meslek]/[legal]/simple-mechanic/
```

### 5. Eski WAIS-HUD Dosyaları
**Neden:** Artık gerekli değil
```
resources/[standalone]/wais-hudv6/web/public/logo_remover.js
resources/[standalone]/wais-hudv6/client/money_sync.lua
```

### 6. Eski qb-inventory Bridge
**Neden:** qb-ox_inventory bridge kullanılıyor
```
resources/[qb]/qb-inventory/client/hud_bridge.lua
```

---

## 🔄 Standart Güncelleme Süreci

### Eski Yöntem (Sorunlu)
```bash
# VPS'de:
cd /home/fivem/data
git pull
# ❌ Silinen dosyalar kalıyor!
```

### Yeni Yöntem (Doğru)
```bash
# VPS'de:
cd /home/fivem/data
./vps_cleanup.sh
# ✅ Önce siler, sonra pull yapar!
```

---

## 🛠️ Script'i Özelleştirme

### Yeni Silme Ekle

Script'e yeni bir silme işlemi eklemek için:

```bash
# vps_cleanup.sh dosyasını düzenle:
nano vps_cleanup.sh

# Şu kısmı bul:
echo "=========================================="
echo "  SİLİNECEK DOSYALAR VE KLASÖRLER"
echo "=========================================="

# Yeni silme ekle:
echo -e "${YELLOW}7. yeni-script kaldırılıyor...${NC}"
remove_if_exists "resources/[standalone]/yeni-script"
echo ""
```

### Server Dizinini Değiştir

```bash
# vps_cleanup.sh dosyasını düzenle:
nano vps_cleanup.sh

# Bu satırı bul:
SERVER_DIR="/home/fivem/data"

# Kendi dizinine göre değiştir:
SERVER_DIR="/path/to/your/server"
```

---

## ⚠️ Önemli Notlar

### 1. Yedek Al
Script çalıştırmadan önce yedek al:
```bash
cd /home/fivem
tar -czf backup-$(date +%Y%m%d).tar.gz data/
```

### 2. Sunucuyu Durdur
Script çalıştırırken sunucu kapalı olmalı:
```bash
# Sunucuyu durdur
screen -r fivem
# Ctrl+C ile durdur

# Script'i çalıştır
./vps_cleanup.sh

# Sunucuyu başlat
./start.sh
```

### 3. Git Durumunu Kontrol Et
Script çalıştırmadan önce:
```bash
cd /home/fivem/data
git status
# Uncommitted changes varsa commit et
```

### 4. Dosya İzinleri
Script çalıştırılabilir olmalı:
```bash
chmod +x vps_cleanup.sh
ls -la vps_cleanup.sh
# -rwxr-xr-x olmalı
```

---

## 🐛 Sorun Giderme

### Sorun 1: Permission Denied
```bash
# Hata:
bash: ./vps_cleanup.sh: Permission denied

# Çözüm:
chmod +x vps_cleanup.sh
```

### Sorun 2: Script Bulunamadı
```bash
# Hata:
bash: ./vps_cleanup.sh: No such file or directory

# Çözüm:
cd /home/fivem/data
ls -la vps_cleanup.sh
# Dosya yoksa git pull yap veya manuel kopyala
```

### Sorun 3: Git Pull Hatası
```bash
# Hata:
error: Your local changes to the following files would be overwritten by merge

# Çözüm:
git stash
./vps_cleanup.sh
git stash pop
```

### Sorun 4: Dosya Silinemedi
```bash
# Hata:
rm: cannot remove 'resources/[qb]/qb-inventory': Permission denied

# Çözüm:
sudo ./vps_cleanup.sh
# veya
sudo chown -R fivem:fivem /home/fivem/data
```

---

## 📝 Alternatif Yöntem: Manuel Silme

Script kullanmak istemiyorsan manuel sil:

```bash
cd /home/fivem/data

# qb-inventory
rm -rf resources/[qb]/qb-inventory

# qb-shops
rm -rf resources/[qb]/qb-shops

# 0r-mechanic
rm -rf resources/[meslek]/[legal]/0r-mechanic

# simple-mechanic
rm -rf resources/[meslek]/[legal]/simple-mechanic

# Eski WAIS-HUD dosyaları
rm -f resources/[standalone]/wais-hudv6/web/public/logo_remover.js
rm -f resources/[standalone]/wais-hudv6/client/money_sync.lua

# Git pull
git pull
```

---

## 🚀 Hızlı Komutlar

### Tek Komutla Güncelleme
```bash
cd /home/fivem/data && ./vps_cleanup.sh && screen -r fivem
```

### Yedek + Güncelleme
```bash
cd /home/fivem && \
tar -czf backup-$(date +%Y%m%d).tar.gz data/ && \
cd data && \
./vps_cleanup.sh
```

### Sunucu Restart ile Güncelleme
```bash
screen -S fivem -X stuff "quit^M" && \
sleep 5 && \
cd /home/fivem/data && \
./vps_cleanup.sh && \
cd /home/fivem && \
./start.sh
```

---

## 📚 Ek Kaynaklar

- [Git Documentation](https://git-scm.com/docs)
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)
- [FiveM Server Management](https://docs.fivem.net/docs/server-manual/)

---

**Tarih:** 2026-04-04  
**Durum:** Aktif Kullanımda ✅
