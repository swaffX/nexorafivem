# OX_INVENTORY HATA ÇÖZÜM REHBERİ

## 🔴 Karşılaşılan Hatalar

### 1. ox_inventory - GetCoreObject Export Hatası
```
SCRIPT ERROR: @ox_inventory/modules/weapon/client.lua:2: 
No such export GetCoreObject in resource qb-core
```

**Neden:** ox_inventory, qb-core'dan ÖNCE yükleniyordu.

**Çözüm:** ✅ server.cfg'de sıra değiştirildi
```cfg
# ÖNCE qb-core
ensure qb-core

# SONRA ox_inventory
ensure oxmysql
ensure ox_lib
ensure ox_inventory
ensure qb-ox_inventory
```

---

### 2. qb-ox_inventory - Search Export Hatası
```
SCRIPT ERROR: @qb-ox_inventory/client/main.lua:6: 
No such export Search in resource ox_inventory
```

**Neden:** `ox_inventory:Search` yerine `exports.ox_inventory:Search` kullanılmalı.

**Çözüm:** ✅ qb-ox_inventory/client/main.lua düzeltildi
```lua
-- ÖNCE:
local count = ox_inventory:Search('count', item)

-- SONRA:
local count = exports.ox_inventory:Search('count', item)
```

---

### 3. qb-radio - HasItem Export Hatası
```
SCRIPT ERROR: citizen:/scripting/lua/scheduler.lua:484: 
An error occurred while calling export `HasItem` in resource `qb-inventory`:nil
```

**Neden:** qb-radio hala qb-inventory'yi arıyor.

**Çözüm:** ✅ qb-ox_inventory bridge düzeltildi (exports.ox_inventory kullanıyor)

---

### 4. WAIS-HUD - Money Field Nil Hatası
```
SCRIPT ERROR: @wais-hudv6/bridge/framework.lua:348: 
attempt to index a nil value (field 'money')
```

**Neden:** WAIS-HUD encrypted, qb-core callback sistemini yanlış kullanıyor.

**Geçici Çözüm:** ⚠️ WAIS-HUD'ı güncelle veya farklı HUD kullan

---

### 5. qb-core - Callback Hatası
```
SCRIPT ERROR: @qb-core/client/functions.lua:39: 
attempt to call a table value (local 'cb')
```

**Neden:** WAIS-HUD encrypted, GetPlayerData'yı yanlış çağırıyor.

**Geçici Çözüm:** ⚠️ WAIS-HUD'ı güncelle

---

## ✅ Yapılan Düzeltmeler

### 1. server.cfg Yükleme Sırası
**Dosya:** `data/server.cfg`

```cfg
# DOĞRU SIRA:
ensure qb-core                # 1. Framework
ensure oxmysql                # 2. Database
ensure ox_lib                 # 3. Library
ensure ox_inventory           # 4. Inventory
ensure qb-ox_inventory        # 5. Bridge
exec @ox_inventory/ox.cfg     # 6. Config
ensure [qb]                   # 7. Diğer QB scriptleri
```

### 2. qb-ox_inventory/client/main.lua
**Dosya:** `data/resources/[standalone]/[ox]/qb-ox_inventory/client/main.lua`

```lua
-- Tüm ox_inventory çağrıları düzeltildi:
local count = exports.ox_inventory:Search('count', item)
exports.ox_inventory:openInventory('stash', name)
exports.ox_inventory:openInventory('shop', { type = name })
exports.ox_inventory:openNearbyInventory()
exports.ox_inventory:openInventory('player', name)
```

---

## ⚠️ Hala Devam Eden Sorunlar

### WAIS-HUD Money Hatası
**Durum:** Encrypted script, düzeltilemez

**Seçenekler:**
1. WAIS-HUD'ı güncelle (yeni versiyon al)
2. Farklı HUD kullan (qb-hud, ps-hud, etc.)
3. WAIS-HUD'ı decrypt et ve düzelt

**Geçici Çözüm:**
```lua
-- Config.lua'da DisableRightCorner kullan
Config.DisableRightCorner = true
```

---

## 🧪 Test Sonuçları

### ✅ Çalışan Özellikler:
- ox_inventory açılıyor (F2)
- Item kullanma çalışıyor
- Drop/pickup çalışıyor
- Stash sistemi çalışıyor
- Shop sistemi çalışıyor
- qb-radio çalışıyor (HasItem export düzeldi)

### ⚠️ Kısmi Çalışan:
- WAIS-HUD (money göstermiyor ama diğer özellikler çalışıyor)

### ❌ Çalışmayan:
- WAIS-HUD money display (encrypted script sorunu)

---

## 🔧 Manuel Düzeltme Adımları

### Adım 1: VPS'de Cleanup
```bash
cd /home/fivem/data
./vps_cleanup.sh
```

### Adım 2: Restart
```bash
restart qb-core
restart oxmysql
restart ox_lib
restart ox_inventory
restart qb-ox_inventory
restart qb-radio
restart wais-hudv6
```

### Adım 3: Test
```
1. F2 ile inventory aç
2. Radio kullan
3. Shop'a git
4. Item kullan
```

---

## 📋 Alternatif HUD Önerileri

WAIS-HUD money sorunu devam ederse:

### 1. qb-hud
```bash
cd /home/fivem/data/resources/[standalone]
git clone https://github.com/qbcore-framework/qb-hud
```

### 2. ps-hud
```bash
cd /home/fivem/data/resources/[standalone]
git clone https://github.com/Project-Sloth/ps-hud
```

### 3. okokHUD
- Ücretli ama çok iyi
- ox_inventory ile tam uyumlu

---

## 🐛 Hata Logları Analizi

### Hata 1: ox_inventory GetCoreObject
```
^1SCRIPT ERROR: @ox_inventory/modules/weapon/client.lua:2: 
No such export GetCoreObject in resource qb-core^7
```
**Durum:** ✅ Düzeltildi (server.cfg sırası)

### Hata 2: qb-ox_inventory Search
```
^1SCRIPT ERROR: @qb-ox_inventory/client/main.lua:6: 
No such export Search in resource ox_inventory^7
```
**Durum:** ✅ Düzeltildi (exports.ox_inventory kullanıldı)

### Hata 3: qb-radio HasItem
```
^1SCRIPT ERROR: citizen:/scripting/lua/scheduler.lua:484: 
An error occurred while calling export `HasItem` in resource `qb-inventory`:nil^7
```
**Durum:** ✅ Düzeltildi (qb-ox_inventory bridge düzeltildi)

### Hata 4: WAIS-HUD money
```
^1SCRIPT ERROR: @wais-hudv6/bridge/framework.lua:348: 
attempt to index a nil value (field 'money')^7
```
**Durum:** ⚠️ Encrypted script, düzeltilemez

### Hata 5: qb-core callback
```
^1SCRIPT ERROR: @qb-core/client/functions.lua:39: 
attempt to call a table value (local 'cb')^7
```
**Durum:** ⚠️ WAIS-HUD encrypted, yanlış kullanım

---

## 🔄 Güncelleme Süreci

### Her Güncelleme Sonrası:
```bash
# 1. Cleanup
cd /home/fivem/data
./vps_cleanup.sh

# 2. Restart
restart qb-core
restart ox_inventory
restart qb-ox_inventory

# 3. Test
# F8 console'da hata var mı kontrol et
```

---

## 📚 Kaynaklar

- [ox_inventory Docs](https://overextended.github.io/docs/ox_inventory/)
- [qb-ox_inventory GitHub](https://github.com/Renewed-Scripts/qb-ox_inventory)
- [QBCore Docs](https://docs.qbcore.org/)

---

## 💡 İpuçları

### 1. Console Logları
F8'de hataları kontrol et:
```
^1 = Kırmızı (Hata)
^3 = Sarı (Uyarı)
^2 = Yeşil (Bilgi)
```

### 2. Resource Durumu
```lua
-- F8 console'da:
GetResourceState('ox_inventory')  -- started olmalı
GetResourceState('qb-ox_inventory')  -- started olmalı
GetResourceState('qb-core')  -- started olmalı
```

### 3. Export Kontrolü
```lua
-- F8 console'da:
exports['ox_inventory']:Search('count', 'water')
exports['qb-core']:GetCoreObject()
```

---

**Tarih:** 2026-04-04  
**Durum:** Çoğu Hata Düzeltildi ✅ | WAIS-HUD Money Sorunu Devam Ediyor ⚠️
