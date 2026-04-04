# OX_INVENTORY KURULUM RAPORU

## 📋 Yapılan İşlemler

### ✅ 1. qb-inventory Kaldırıldı
- qb-inventory klasörü kullanıcı tarafından silindi
- Yerine ox_inventory kuruldu

### ✅ 2. qb-shops Kaldırıldı
- `data/resources/[qb]/qb-shops` klasörü silindi
- ox_inventory'nin kendi shop sistemi kullanılacak

### ✅ 3. OX Scriptleri Eklendi
Klasör: `data/resources/[standalone]/[ox]/`

**Yüklenen Scriptler:**
- ✅ `oxmysql` - MySQL kütüphanesi
- ✅ `ox_lib` - Temel kütüphane
- ✅ `ox_inventory` - Ana inventory sistemi
- ✅ `qb-ox_inventory` - QBCore bridge (qb-inventory yerine geçer)

### ✅ 4. server.cfg Güncellendi

```cfg
# QBCore & Extra stuff
# OX Inventory System
ensure oxmysql
ensure ox_lib
ensure ox_inventory
ensure qb-ox_inventory

# Load qb-core FIRST
ensure qb-core

# Then load [qb] folder
ensure [exe-eklenti]

# OX Inventory Config
exec @ox_inventory/ox.cfg

# Then load remaining resources
ensure [alan] 
ensure [qb]
ensure [standalone]
```

**Yükleme Sırası:**
1. oxmysql (database)
2. ox_lib (kütüphane)
3. ox_inventory (inventory sistemi)
4. qb-ox_inventory (bridge - qb-inventory yerine geçer)
5. qb-core
6. ox.cfg config dosyası
7. Diğer scriptler

---

## 🔧 Yapılandırma

### ox.cfg Ayarları
**Dosya:** `data/resources/[standalone]/[ox]/ox_inventory/ox.cfg`

**Önemli Ayarlar:**
```cfg
# Framework
setr inventory:framework "qb"

# Inventory Ayarları
setr inventory:slots 50
setr inventory:weight 100000

# Polis Meslekleri
setr inventory:police ["police", "sheriff"]

# Açılış Tuşu
setr inventory:keys ["F2"]

# Görsel Ayarlar
setr inventory:screenblur true
setr inventory:itemnotify true
setr inventory:weaponnotify true
setr inventory:dropprops true
```

---

## 🏪 Shop Sistemi

### ox_inventory Shop Config
**Dosya:** `data/resources/[standalone]/[ox]/ox_inventory/data/shops.lua`

**Mevcut Shoplar:**
- ✅ Megamall (24/7)
- ✅ Ammunation1 (Silahçı)
- ✅ Ammunation2 (Silahçı)
- ⚠️ Liquor (Kapalı - aktif edilebilir)

**Shop Ekleme Örneği:**
```lua
['24/7'] = {
    name = '24/7 Market',
    blip = {
        id = 52, colour = 2, scale = 0.6
    },
    inventory = {
        { name = 'water', price = 10 },
        { name = 'bread', price = 15 },
        { name = 'phone', price = 5000 },
    },
    locations = {
        vec3(25.06, -1347.32, 29.5),
        vec3(-3038.71, 585.95, 7.91),
    },
    targets = {
        { loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
    }
}
```

---

## 📦 Item Sistemi

### Items Config
**Dosya:** `data/resources/[standalone]/[ox]/ox_inventory/data/items.lua`

**Item Ekleme Örneği:**
```lua
['water'] = {
    label = 'Su',
    weight = 500,
    stack = true,
    close = true,
    description = 'Bir şişe su',
    client = {
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        prop = { model = 'prop_ld_flow_bottle', 
                 pos = vec3(0.03, 0.03, 0.02), 
                 rot = vec3(0.0, 0.0, -1.5) },
        usetime = 2500,
    }
}
```

---

## 🔄 qb-ox_inventory Bridge

### Ne İşe Yarar?
- qb-inventory exportlarını ox_inventory'ye yönlendirir
- Eski qb-inventory kullanan scriptler çalışmaya devam eder
- `provide 'qb-inventory'` ile qb-inventory yerine geçer

### Desteklenen Exportlar:
```lua
-- Inventory açma
exports['qb-inventory']:OpenInventory()

-- Item ekleme/çıkarma
exports['qb-inventory']:AddItem(source, item, amount)
exports['qb-inventory']:RemoveItem(source, item, amount)

-- Item kontrolü
exports['qb-inventory']:HasItem(source, item, amount)
exports['qb-inventory']:GetItemByName(source, item)

-- Stash işlemleri
exports['qb-inventory']:OpenStash(source, stashId)
```

---

## 🗄️ Database

### Gerekli Tablolar
ox_inventory otomatik olarak gerekli tabloları oluşturur:
- `ox_inventory` - Ana inventory tablosu
- `ox_stashes` - Stash verileri

**Manuel Oluşturma Gerekmez!**

---

## ⚙️ Uyumluluk

### ✅ Uyumlu Scriptler
- qb-core
- qb-weapons
- qb-customs (mekanik scripti)
- qb-ambulancejob
- qb-policejob
- qb-garages
- qb-vehiclekeys
- Tüm ox_lib kullanan scriptler

### ⚠️ Güncelleme Gerekebilir
- qb-crafting (ox_inventory crafting kullanılabilir)
- Eski qb-inventory'ye özel yazılmış scriptler

### ❌ Kaldırılan Scriptler
- qb-inventory (ox_inventory ile değiştirildi)
- qb-shops (ox_inventory shops ile değiştirildi)

---

## 🧪 Test Senaryoları

### Test 1: Inventory Açma
```
1. Oyuna gir
2. F2 tuşuna bas
3. Inventory açılmalı
```

### Test 2: Item Kullanma
```
1. Inventory'de bir item'e tıkla
2. "Use" butonuna bas
3. Item kullanılmalı (örn: su içme animasyonu)
```

### Test 3: Shop Sistemi
```
1. Megamall'a git (haritada mavi blip)
2. Shop NPC'sine yaklaş
3. E tuşuna bas (veya target)
4. Shop menüsü açılmalı
5. Item satın al
```

### Test 4: Drop/Pickup
```
1. Inventory'den bir item'i sürükle
2. Inventory dışına bırak
3. Yerde prop görünmeli
4. E tuşu ile geri al
```

### Test 5: Stash Sistemi
```
1. Bir stash'e yaklaş (örn: polis evidence)
2. E tuşuna bas
3. Stash açılmalı
4. Item koy/çıkar
```

---

## 🐛 Sorun Giderme

### Sorun 1: Inventory Açılmıyor
**Çözüm:**
```bash
# F8 console'da:
restart ox_inventory
restart qb-ox_inventory
```

**Kontrol:**
- F2 tuşu başka bir script tarafından kullanılıyor mu?
- ox.cfg yüklendi mi? (server console'da kontrol et)

---

### Sorun 2: Items Görünmüyor
**Çözüm:**
```lua
-- data/items.lua dosyasını kontrol et
-- Item tanımı var mı?
-- Image path doğru mu?
```

**Image Path:**
```cfg
setr inventory:imagepath "nui://ox_inventory/web/images"
```

---

### Sorun 3: Shop Çalışmıyor
**Çözüm:**
```lua
-- data/shops.lua dosyasını kontrol et
-- Shop koordinatları doğru mu?
-- Blip ayarları doğru mu?
```

**Target Kullanıyorsan:**
```cfg
setr inventory:target true
```

---

### Sorun 4: Eski qb-inventory Exportları Çalışmıyor
**Çözüm:**
```bash
# qb-ox_inventory bridge yüklü mü kontrol et:
ensure qb-ox_inventory

# Restart:
restart qb-ox_inventory
```

---

### Sorun 5: Database Hatası
**Çözüm:**
```bash
# oxmysql yüklü mü kontrol et:
ensure oxmysql

# Connection string doğru mu:
set mysql_connection_string "mysql://nexora:Nexora123!@127.0.0.1/temelpaket?charset=utf8mb4"
```

---

## 📝 Önemli Notlar

### 1. Item Images
- Item resimleri: `ox_inventory/web/images/` klasöründe
- Format: `item_name.png` (örn: `water.png`)
- Boyut: 128x128 px önerilir

### 2. Weapon Attachments
- ox_inventory silah attachment sistemini destekler
- qb-weapons ile uyumlu
- Attachment config: `data/weapons.lua`

### 3. Crafting System
- ox_inventory'nin kendi crafting sistemi var
- Config: `data/crafting.lua`
- qb-crafting yerine kullanılabilir

### 4. Stash System
- Kişisel stash'ler
- Job stash'leri (polis, ambulans)
- Vehicle trunk/glovebox
- Dumpster/drop loot

### 5. Performance
- ox_inventory optimize edilmiş
- qb-inventory'den daha performanslı
- Resmon: ~0.01ms (idle), ~0.05ms (açıkken)

---

## 🔄 Güncelleme

### ox_inventory Güncelleme
```bash
cd data/resources/[standalone]/[ox]/ox_inventory
git pull
restart ox_inventory
```

### qb-ox_inventory Güncelleme
```bash
cd data/resources/[standalone]/[ox]/qb-ox_inventory
git pull
restart qb-ox_inventory
```

---

## 📚 Kaynaklar

- [ox_inventory Dokümantasyon](https://overextended.github.io/docs/ox_inventory/)
- [ox_lib Dokümantasyon](https://overextended.github.io/docs/ox_lib/)
- [GitHub - ox_inventory](https://github.com/overextended/ox_inventory)
- [GitHub - qb-ox_inventory](https://github.com/Renewed-Scripts/qb-ox_inventory)

---

## ✅ Kurulum Tamamlandı

**Yapılması Gerekenler:**
1. ✅ oxmysql yüklendi
2. ✅ ox_lib yüklendi
3. ✅ ox_inventory yüklendi
4. ✅ qb-ox_inventory bridge yüklendi
5. ✅ qb-inventory kaldırıldı
6. ✅ qb-shops kaldırıldı
7. ✅ server.cfg güncellendi
8. ⏳ Sunucuyu restart et
9. ⏳ Test et

**Restart Komutu:**
```bash
restart oxmysql
restart ox_lib
restart ox_inventory
restart qb-ox_inventory
restart qb-core
```

veya

```bash
# Tüm sunucuyu restart et
quit
# Sonra sunucuyu tekrar başlat
```

---

**Tarih:** 2026-04-04  
**Durum:** Kurulum Tamamlandı ✅ | Test Bekliyor ⏳
