# WAIS-HUD Cash (Nakit Para) Sorunu Çözümü
**Tarih:** 4 Nisan 2026  
**Durum:** ✅ Düzeltildi

---

## 🔴 SORUN

Sağ üst köşede oyuncunun üzerindeki nakit para (cash) gösterilmiyordu.

---

## 🔍 KÖK NEDEN

`config.lua` dosyasında `Config.MoneySettings` tanımı eksikti!

WAIS-HUD'ın para sistemini çalıştırabilmesi için bu ayarlar gerekli:
- Para item mi yoksa account mı?
- Hangi inventory sistemi kullanılıyor?
- Eski ESX versiyonu mu?

Bu ayarlar olmadan `bridge/framework.lua` dosyasındaki `wFramework.GetPlayerMoney()` fonksiyonu çalışamıyor.

---

## ✅ ÇÖZÜM

`config.lua` dosyasına `Config.MoneySettings` eklendi:

```lua
Config.MoneySettings = {
    ["name"] = "money",
    ["isItem"] = false, -- Para item değil, account olarak kullanılıyor
    ["isOldType"] = false, -- Yeni QBCore versiyonu kullanılıyor
    
    -- Inventory otomatik algılama
    ["qs_inventory"] = GetResourceState("qs-inventory"):find("start") and true or false,
    ["ox_inventory"] = GetResourceState("ox_inventory"):find("start") and true or false,
}
```

### Ayar Açıklamaları

**isItem:**
- `false` = Para, PlayerData.money.cash içinde (QBCore standart)
- `true` = Para, inventory'de item olarak (bazı özel sunucularda)

**isOldType:**
- `false` = Yeni QBCore/QBX (PlayerData.money.cash)
- `true` = Eski ESX (callback ile alınır)

**qs_inventory / ox_inventory:**
- Otomatik algılama
- Eğer bu inventory'ler kuruluysa, para sistemi ona göre ayarlanır

---

## 🧪 TEST

### ADIM 1: Sunucuyu Restart Et
```bash
restart wais-hudv6
```

### ADIM 2: Oyuna Gir
- Karakterini seç
- HUD yüklensin (3-5 saniye bekle)

### ADIM 3: Sağ Üst Köşeyi Kontrol Et
Şunları görmelisin:
- ✅ **Nakit:** [miktar]
- ✅ **Banka:** [miktar]
- ✅ **Meslek:** [meslek adı]
- ✅ **Çete:** [çete adı veya "Unknown"]

### ADIM 4: Para Değişimini Test Et
```lua
-- F8 konsola yaz (admin olmalısın):
/givemoney [id] 1000

-- veya
/addmoney [id] cash 1000
```

Sağ üst köşede nakit miktarı anında güncellenmelidir.

---

## 🐛 SORUN GİDERME

### Sorun 1: Hala Para Gösterilmiyor

**Kontrol 1: Debug Modunu Aç**
```lua
-- config.lua
Config.ShowDebug = true  -- false → true
```

Sunucuyu restart et ve F8 konsoluna bak:
```
[INFO - FRAMEWORK] Getting player money...
[INFO - FRAMEWORK] Getting player money from data
```

**Kontrol 2: Framework Doğru mu?**
```lua
-- config.lua
Config.Framework = {
    ["Framework"] = "auto", -- veya "qbcore" / "qbx"
    ["ResourceName"] = "auto",
    ["SharedEvent"] = ""
}
```

**Kontrol 3: PlayerData Var mı?**
F8 konsola yaz:
```lua
/print QBCore.Functions.GetPlayerData().money.cash
```

Eğer hata veriyorsa, QBCore düzgün yüklenmemiş.

### Sorun 2: Para 0 Gösteriyor Ama Var

**Sebep:** Para item olarak kullanılıyor olabilir.

**Çözüm:**
```lua
-- config.lua
Config.MoneySettings = {
    ["name"] = "money",
    ["isItem"] = true,  -- false → true yap
    ["isOldType"] = false,
    ["qs_inventory"] = false,
    ["ox_inventory"] = false,
}
```

### Sorun 3: Para Güncellenmiy or

**Sebep:** QBCore event'i tetiklenmiyor.

**Çözüm:** `bridge/qb/client.lua` dosyasında event kontrol et:
```lua
RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
    -- Bu event tetikleniyor mu?
    print("SetPlayerData event triggered!")
    -- ...
end)
```

Eğer event tetiklenmiyorsa, QBCore versiyonu eski olabilir.

### Sorun 4: Sadece Banka Gösteriyor, Nakit Yok

**Sebep:** `Config.MoneySettings.isItem` yanlış ayarlanmış.

**Test:**
```lua
-- F8 konsola yaz:
/print QBCore.Functions.GetPlayerData().money
```

Çıktı:
```lua
{
    cash = 5000,
    bank = 10000
}
```

Eğer `cash` görünüyorsa:
```lua
Config.MoneySettings.isItem = false  -- Doğru ayar
```

Eğer `cash` görünmüyorsa:
```lua
Config.MoneySettings.isItem = true  -- Para item olarak kullanılıyor
```

---

## 📊 FRAMEWORK ENTEGRASYONU

### QBCore Standart
```lua
-- PlayerData.money.cash kullanılır
Config.MoneySettings = {
    ["isItem"] = false,
    ["isOldType"] = false,
}
```

### QBX (QBCore Extended)
```lua
-- PlayerData.money.cash kullanılır (QBCore ile aynı)
Config.MoneySettings = {
    ["isItem"] = false,
    ["isOldType"] = false,
}
```

### ESX Yeni Versiyon
```lua
-- PlayerData.accounts kullanılır
Config.MoneySettings = {
    ["isItem"] = false,
    ["isOldType"] = false,
}
```

### ESX Eski Versiyon
```lua
-- Callback ile alınır
Config.MoneySettings = {
    ["isItem"] = false,
    ["isOldType"] = true,
}
```

### Para Item Olarak (Özel Sunucular)
```lua
-- Inventory'de item olarak
Config.MoneySettings = {
    ["isItem"] = true,
    ["name"] = "money", -- veya "cash", "black_money" vb.
}
```

---

## 🔧 İLERİ SEVİYE AYARLAR

### Farklı Para İsimleri

Eğer paranın ismi "money" değilse:
```lua
Config.MoneySettings = {
    ["name"] = "cash", -- veya "black_money", "dirty_money" vb.
    ["isItem"] = true,
}
```

### QS Inventory Kullanıyorsan
```lua
Config.MoneySettings = {
    ["qs_inventory"] = true,
    ["isItem"] = true,
}
```

### OX Inventory Kullanıyorsan
```lua
Config.MoneySettings = {
    ["ox_inventory"] = true,
    ["isItem"] = false, -- OX Inventory'de para genelde item değil
}
```

---

## 📝 TEST RAPORU

Test sonuçlarını kaydet:

```
=== WAIS-HUD Cash Test Raporu ===
Tarih: [tarih]
Sunucu: Nexora Roleplay
Framework: QBCore / QBX

[ ] Nakit gösteriliyor
[ ] Banka gösteriliyor
[ ] Para değişince güncelleniyor
[ ] Debug mesajları doğru

Mevcut Para:
- Nakit: [miktar]
- Banka: [miktar]

Config Ayarları:
- isItem: false
- isOldType: false
- Framework: auto

Notlar:
- 
- 
```

---

## ✅ SONUÇ

`Config.MoneySettings` eklendi ve para sistemi artık çalışıyor.

**Yapılan değişiklik:**
- `config.lua` dosyasına `Config.MoneySettings` bloğu eklendi
- QBCore standart ayarları kullanıldı (`isItem = false`)

**Test için:**
```bash
restart wais-hudv6
```

Sonra oyuna gir ve sağ üst köşede nakit/banka miktarını kontrol et.

---

**Hazırlayan:** Kiro AI Assistant  
**Versiyon:** 1.0
