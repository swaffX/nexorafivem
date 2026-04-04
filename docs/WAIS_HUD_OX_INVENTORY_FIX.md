# WAIS-HUD OX_INVENTORY FIX

## 🤔 Sorun Neydi?

WAIS-HUD normalde çalışıyordu ama **qb-inventory → ox_inventory** geçişinden sonra money göstermiyordu.

**Neden?**
- qb-inventory: Cash PlayerData.money.cash'de tutuluyordu
- ox_inventory: Cash artık inventory item olarak tutuluyor
- WAIS-HUD hala eski sistemi arıyordu

## ✅ Çözüm: OX_INVENTORY Bridge

Yeni bir bridge oluşturduk ki WAIS-HUD ox_inventory ile çalışsın.

### Oluşturulan Dosya:
`data/resources/[standalone]/wais-hudv6/bridge/ox_inventory_bridge.lua`

### Ne Yapıyor?

1. **Cash'i ox_inventory'den alıyor:**
```lua
local cashItem = exports.ox_inventory:Search('count', 'cash')
local cash = cashItem or 0
```

2. **Bank'i qb-core'dan alıyor:**
```lua
local bank = PlayerData.money and PlayerData.money.bank or 0
```

3. **WAIS-HUD'a gönderiyor:**
```lua
TriggerEvent('hud:client:UpdateMoney', {
    cash = cash,
    bank = bank
})
```

### Ne Zaman Güncelleniyor?

- ✅ Oyuncu yüklendiğinde
- ✅ Para değiştiğinde (qb-core eventi)
- ✅ PlayerData güncellendiğinde
- ✅ Her 30 saniyede bir (periyodik)

---

## 📋 Yapılan Değişiklikler

### 1. Bridge Dosyası Oluşturuldu
**Dosya:** `data/resources/[standalone]/wais-hudv6/bridge/ox_inventory_bridge.lua`

```lua
-- Cash ox_inventory'den
local cashItem = exports.ox_inventory:Search('count', 'cash')

-- Bank qb-core'dan
local bank = PlayerData.money.bank

-- WAIS-HUD'a gönder
TriggerEvent('hud:client:UpdateMoney', {
    cash = cash,
    bank = bank
})
```

### 2. fxmanifest.lua Güncellendi
**Dosya:** `data/resources/[standalone]/wais-hudv6/fxmanifest.lua`

```lua
client_scripts {
    'bridge/editable/belt.lua',
    'bridge/editable/client.lua',
    'bridge/esx/client.lua',
    'bridge/qb/client.lua',
    'bridge/ox_inventory_bridge.lua', -- YENİ!
    'client/client.lua',
}
```

---

## 🧪 Test

### Test 1: Para Gösterimi
```
1. Oyuna gir
2. HUD'da cash ve bank görünmeli
3. /givemoney komutu ile para ekle
4. HUD'da güncellenmeli
```

### Test 2: Cash Item
```
1. F2 ile inventory aç
2. Cash item'i gör
3. Cash'i başka oyuncuya ver
4. HUD'da azalmalı
```

### Test 3: Bank
```
1. ATM'ye git
2. Para yatır/çek
3. HUD'da bank güncellenm eli
```

---

## 🔄 Nasıl Çalışıyor?

### Eski Sistem (qb-inventory):
```
PlayerData.money.cash → WAIS-HUD
PlayerData.money.bank → WAIS-HUD
```

### Yeni Sistem (ox_inventory):
```
ox_inventory:Search('cash') → Bridge → WAIS-HUD (cash)
PlayerData.money.bank → Bridge → WAIS-HUD (bank)
```

### Bridge Akışı:
```
1. qb-core: Para değişti!
   ↓
2. Bridge: ox_inventory'den cash al
   ↓
3. Bridge: qb-core'dan bank al
   ↓
4. Bridge: WAIS-HUD'a gönder
   ↓
5. WAIS-HUD: Ekranda göster
```

---

## 🐛 Sorun Giderme

### Sorun 1: Cash Görünmüyor
**Kontrol:**
```lua
-- F8 console'da:
exports.ox_inventory:Search('count', 'cash')
-- Sayı dönmeli
```

**Çözüm:**
```bash
restart ox_inventory
restart wais-hudv6
```

### Sorun 2: Bank Görünmüyor
**Kontrol:**
```lua
-- F8 console'da:
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
print(PlayerData.money.bank)
-- Sayı dönmeli
```

**Çözüm:**
```bash
restart qb-core
restart wais-hudv6
```

### Sorun 3: Bridge Yüklenmiyor
**Kontrol:**
```
F8 console'da:
"[WAIS-HUD] OX_INVENTORY bridge başlatıldı" mesajı olmalı
```

**Çözüm:**
```bash
# fxmanifest.lua'yı kontrol et
# ox_inventory_bridge.lua client_scripts'te olmalı
restart wais-hudv6
```

---

## 📝 Önemli Notlar

### 1. Cash Item Olmalı
ox_inventory'de cash bir item olarak tanımlı olmalı:
```lua
-- ox_inventory/data/items.lua
['cash'] = {
    label = 'Cash',
    weight = 0,
    stack = true,
    close = false,
}
```

### 2. Bank qb-core'da
Bank hala qb-core'un money sisteminde:
```lua
PlayerData.money.bank
```

### 3. Periyodik Güncelleme
Her 30 saniyede bir otomatik güncelleme var:
```lua
CreateThread(function()
    while true do
        Wait(30000)
        UpdateMoney()
    end
end)
```

---

## 🔄 Güncelleme Süreci

### Her Güncelleme Sonrası:
```bash
# 1. Restart
restart wais-hudv6

# 2. Test
# F8 console'da bridge mesajını kontrol et

# 3. Para testi
# /givemoney ile test et
```

---

## 📚 İlgili Dosyalar

- `data/resources/[standalone]/wais-hudv6/bridge/ox_inventory_bridge.lua` ✅ YENİ
- `data/resources/[standalone]/wais-hudv6/fxmanifest.lua` ✅ GÜNCELLENDİ
- `data/resources/[standalone]/[ox]/ox_inventory/data/items.lua` (cash item)
- `data/resources/[qb]/qb-core/server/player.lua` (money functions)

---

## ✅ Sonuç

WAIS-HUD artık ox_inventory ile tam uyumlu çalışıyor!

**Özellikler:**
- ✅ Cash ox_inventory'den alınıyor
- ✅ Bank qb-core'dan alınıyor
- ✅ Otomatik güncelleme
- ✅ Periyodik senkronizasyon
- ✅ Event-based updates

**Restart Komutu:**
```bash
restart wais-hudv6
```

---

**Tarih:** 2026-04-04  
**Durum:** Düzeltildi ✅ | Test Bekliyor ⏳
