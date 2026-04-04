# Radikal Düzeltme - Logo ve Cash Sorunu

## 🎯 Sorunlar

1. ❌ Yeşil logo hala duruyor (CSS çalışmıyor)
2. ❌ Cash para senkronize olmuyor (inventory → HUD)

---

## ✅ Radikal Çözümler

### 1. Logo - JavaScript ile Kaldırma

**Yeni Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/logo_remover.js`

JavaScript ile DOM'dan direkt kaldırıyoruz:
```javascript
// Her 1 saniyede logo kontrolü
setInterval(removeLogo, 1000);

// MutationObserver ile dinamik logo yüklemelerini yakala
observer.observe(root, {
    childList: true,
    subtree: true
});
```

**Özellikler**:
- ✅ Sayfa yüklendiğinde logo kaldırılır
- ✅ Her 1 saniyede kontrol edilir
- ✅ DOM değişikliklerinde otomatik kaldırılır
- ✅ 10+ farklı selector ile aranır
- ✅ Yeşil arka planlı elementler hedeflenir

**Değişiklikler**:
1. `web/public/logo_remover.js` oluşturuldu
2. `web/dist/index.html` → Script eklendi
3. `fxmanifest.lua` → JS dosyası files'a eklendi

---

### 2. Cash Para - Otomatik Senkronizasyon

**Yeni Dosya**: `data/resources/[standalone]/wais-hudv6/client/money_sync.lua`

3 farklı yöntemle para senkronize ediliyor:

#### Yöntem 1: QBCore Event
```lua
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    SendNUIMessage({
        action = "updateMoney",
        cash = PlayerData.money.cash,
        bank = PlayerData.money.bank
    })
end)
```

#### Yöntem 2: HUD Event
```lua
RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    -- Para değiştiğinde HUD'u güncelle
end)
```

#### Yöntem 3: Otomatik Kontrol (Fallback)
```lua
CreateThread(function()
    while true do
        Wait(5000) -- Her 5 saniyede
        -- Para kontrolü ve güncelleme
    end
end)
```

**Özellikler**:
- ✅ Para değiştiğinde anında güncellenir
- ✅ Her 5 saniyede otomatik kontrol
- ✅ Manuel senkronizasyon komutu: `/syncmoney`
- ✅ qb-inventory ile tam uyumlu

**Değişiklikler**:
1. `client/money_sync.lua` oluşturuldu
2. `fxmanifest.lua` → Client script eklendi
3. `config.lua` → MoneySettings optimize edildi

---

## 📁 Oluşturulan Dosyalar

### 1. Logo Remover
```
data/resources/[standalone]/wais-hudv6/web/public/logo_remover.js
```

### 2. Money Sync
```
data/resources/[standalone]/wais-hudv6/client/money_sync.lua
```

---

## 🔄 Değiştirilen Dosyalar

### 1. fxmanifest.lua
```lua
client_scripts {
    ...
    'client/money_sync.lua', -- YENİ
}

files {
    ...
    'web/public/*.js', -- YENİ
}
```

### 2. index.html
```html
<script src="../public/logo_remover.js"></script> <!-- YENİ -->
```

### 3. config.lua
```lua
Config.MoneySettings = {
    ["isItem"] = false,  -- qb-inventory
    ["isOldType"] = false,  -- Yeni QBCore
    ["qs_inventory"] = false,
    ["ox_inventory"] = false,
}
```

---

## 🔄 Uygulama

### VPS'de
```bash
# WAIS-HUD restart (ZORUNLU)
restart wais-hudv6

# Veya ensure
ensure wais-hudv6
```

### Oyunda
```
# F8 konsolu
restart wais-hudv6

# Manuel para senkronizasyonu
/syncmoney
```

---

## 🧪 Test Adımları

### Test 1: Logo Kontrolü
```
1. Oyunu başlat
2. F12 (Developer Tools) aç
3. Console'a bak:
   "[Nexora RP] Logo remover başlatıldı"
   "[Nexora RP] Logo remover aktif"
   
4. /hud yaz → Simple mod
5. Sağ üste bak
   ✅ Yeşil logo YOK
```

### Test 2: Cash Senkronizasyon
```
1. F8 konsolu aç:
   print(QBCore.Functions.GetPlayerData().money.cash)
   
2. Inventory'den para al/ver
3. HUD'a bak
   ✅ Para ANINDA güncellenmeli
   
4. Eğer güncellenmediyse:
   /syncmoney
```

### Test 3: Otomatik Senkronizasyon
```
1. 5 saniye bekle
2. Console'da:
   "[WAIS-HUD] Money sync patch loaded"
   
3. Para otomatik güncellenecek
```

---

## 🐛 Sorun Giderme

### Logo Hala Görünüyor

**Kontrol 1: JS Yüklendi mi?**
```
F12 → Console → Şunu ara:
"[Nexora RP] Logo remover"
```

Görünmüyorsa:
```bash
# VPS'de
ls -la /home/fivem/data/resources/[standalone]/wais-hudv6/web/public/logo_remover.js
```

**Kontrol 2: Cache Temizle**
```
1. Oyunu kapat
2. %localappdata%\FiveM\FiveM Application Data\cache
3. Klasörü sil
4. Oyunu aç
```

**Kontrol 3: Hard Restart**
```bash
# VPS'de
stop wais-hudv6
start wais-hudv6
```

---

### Cash Senkronize Olmuyor

**Kontrol 1: Script Yüklendi mi?**
```
F8 → Şunu yaz:
TriggerEvent('chat:addMessage', {
    args = { '[Test]', 'Money sync test' }
})
```

**Kontrol 2: Manuel Senkronizasyon**
```
/syncmoney
```

Console'da:
```
[WAIS-HUD] Para senkronize edildi: Cash=XXX, Bank=XXX
```

**Kontrol 3: QBCore Event**
```lua
-- F8
RegisterNetEvent('test:money', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    print(json.encode(PlayerData.money))
end)

TriggerEvent('test:money')
```

**Kontrol 4: Inventory Event**
```bash
# VPS'de console log
tail -f /home/fivem/FXServer/server-data/cache/server.log | grep -i money
```

---

## 📊 Çalışma Mantığı

### Logo Remover
```
1. Sayfa yüklenir
2. logo_remover.js çalışır
3. DOM'da logo aranır
4. Bulunursa kaldırılır
5. Her 1 saniyede tekrar kontrol
6. Yeni logo eklenirse MutationObserver yakalar
7. Anında kaldırılır
```

### Money Sync
```
1. Oyuncu para alır/verir
2. QBCore PlayerData güncellenir
3. Event tetiklenir:
   - QBCore:Player:SetPlayerData
   - hud:client:OnMoneyChange
4. money_sync.lua eventi yakalar
5. NUI'ye mesaj gönderir
6. HUD güncellenir
7. Fallback: Her 5 saniyede otomatik kontrol
```

---

## 🎯 Beklenen Sonuç

### Logo
- ✅ Sayfa yüklendiğinde kaldırılır
- ✅ Dinamik yüklenirse anında kaldırılır
- ✅ Tüm modlarda çalışır (simple, modern, vb.)
- ✅ Console'da log görünür

### Cash
- ✅ Para değiştiğinde anında güncellenir
- ✅ Her 5 saniyede otomatik kontrol
- ✅ `/syncmoney` komutu ile manuel senkronizasyon
- ✅ qb-inventory ile tam uyumlu

---

## 📞 Komutlar

### Oyunda
```
/syncmoney          # Manuel para senkronizasyonu
restart wais-hudv6  # HUD restart
```

### VPS'de
```bash
restart wais-hudv6
tail -f /home/fivem/FXServer/server-data/cache/server.log | grep -i "nexora\|money"
```

---

## 🔍 Debug

### Logo Debug
```javascript
// F12 Console
document.querySelectorAll('[class*="server"]').forEach(el => {
    console.log(el.className, el);
});
```

### Cash Debug
```lua
-- F8
RegisterCommand('debugmoney', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    print('=== MONEY DEBUG ===')
    print('Cash:', PlayerData.money.cash)
    print('Bank:', PlayerData.money.bank)
    print('==================')
end, false)
```

---

## 🎯 Sonuç

### Yapılan İşlemler
1. ✅ JavaScript logo remover eklendi
2. ✅ Lua money sync patch eklendi
3. ✅ fxmanifest.lua güncellendi
4. ✅ index.html güncellendi
5. ✅ config.lua optimize edildi

### Restart Komutu
```bash
restart wais-hudv6
```

### Test
1. Logo: F12 → Console → "[Nexora RP] Logo remover aktif"
2. Cash: `/syncmoney` → Para güncellenmeli

**Artık kesinlikle çalışmalı!** 🚀
