# Logo Değiştirme ve Cash Düzeltmesi - Final

## 🎯 Değişiklikler

1. ✅ Yeşil logo → Nexora logosu (myLogo.png)
2. ✅ Cash senkronizasyon güçlendirildi

---

## 1. Logo Değiştirme

### Yapılan İşlem
Yeşil kare logo kaldırılmadı, **Nexora logosu ile değiştirildi**.

**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/logo_remover.js`

### Nasıl Çalışıyor?
```javascript
// 1. Yeşil arka planı kaldır
el.style.background = 'transparent';

// 2. İçeriği temizle
el.innerHTML = '';

// 3. Nexora logosunu ekle
const img = document.createElement('img');
img.src = 'nui://nexorafivem/data/myLogo.png';
el.appendChild(img);
```

### Logo Yolu
```
nui://nexorafivem/data/myLogo.png
```

Bu yol FiveM'in NUI sistemi ile `data/myLogo.png` dosyasını yükler.

### CSS Değişikliği
```css
/* Yeşil arka planı kaldır */
.server-info,
[class*="server-info"] {
    background: transparent !important;
    background-color: transparent !important;
}
```

---

## 2. Cash Senkronizasyon - Güçlendirilmiş

### Yapılan İyileştirmeler

#### 1. Daha Fazla Event
```lua
-- Eski: 2 event
-- Yeni: 5 event

RegisterNetEvent('hud:client:OnMoneyChange')
RegisterNetEvent('QBCore:Player:SetPlayerData')
RegisterNetEvent('QBCore:Client:OnMoneyChange')  -- YENİ
RegisterNetEvent('inventory:client:ItemBox')     -- YENİ
RegisterNetEvent('QBCore:Client:OnPlayerLoaded') -- YENİ
```

#### 2. Daha Sık Kontrol
```lua
-- Eski: Her 5 saniye
-- Yeni: Her 3 saniye

CreateThread(function()
    while true do
        Wait(3000)  -- 5000 → 3000
        UpdateMoney()
    end
end)
```

#### 3. Değişiklik Kontrolü
```lua
-- Sadece para değiştiyse güncelle
if currentCash ~= lastCash or currentBank ~= lastBank then
    SendNUIMessage(...)
    print('[WAIS-HUD] Para güncellendi')
end
```

#### 4. Gecikme Eklendi
```lua
-- PlayerData'nın güncellenmesini bekle
RegisterNetEvent('...', function()
    Wait(100)  -- 100ms gecikme
    UpdateMoney()
end)
```

#### 5. Spawn Event
```lua
-- Oyuncu spawn olduğunda
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    UpdateMoney()
end)
```

---

## 🔄 Uygulama

### VPS'de
```bash
restart wais-hudv6
```

### Oyunda
```
restart wais-hudv6
/syncmoney
```

---

## 🧪 Test Adımları

### Test 1: Logo Kontrolü
```
1. Oyunu başlat
2. /hud → Simple mod
3. Sağ üste bak
   ✅ Nexora logosu görünmeli (myLogo.png)
   ❌ Yeşil kare OLMAMALI
   
4. F12 Console:
   "[Nexora RP] Logo replacer aktif"
   "[Nexora RP] Logo değiştirildi"
```

### Test 2: Cash Senkronizasyon
```
1. F8 konsolu:
   print(QBCore.Functions.GetPlayerData().money.cash)
   
2. Inventory'den para al/ver
3. 3 saniye içinde HUD güncellenmeli
   
4. Manuel test:
   /syncmoney
   
5. Console'da:
   "[WAIS-HUD] Para güncellendi: Cash=XXX, Bank=XXX"
```

### Test 3: Spawn Testi
```
1. Sunucudan çık
2. Tekrar gir
3. 2 saniye sonra para otomatik yüklenmeli
4. Console:
   "[WAIS-HUD] Oyuncu yüklendi, para senkronize edildi"
```

---

## 🐛 Sorun Giderme

### Logo Görünmüyor

**Kontrol 1: myLogo.png Var mı?**
```bash
# VPS'de
ls -la /home/fivem/data/myLogo.png
```

Yoksa:
```bash
# Yerel bilgisayardan VPS'e yükle
scp C:\Users\zeyne\OneDrive\Masaüstü\nexorafivem\data\myLogo.png root@VPS_IP:/home/fivem/data/
```

**Kontrol 2: NUI Yolu**
```javascript
// F12 Console
fetch('nui://nexorafivem/data/myLogo.png')
  .then(r => console.log('Logo yüklendi:', r.ok))
  .catch(e => console.error('Logo yüklenemedi:', e));
```

**Kontrol 3: Cache Temizle**
```
1. Oyunu kapat
2. %localappdata%\FiveM\FiveM Application Data\cache
3. Klasörü sil
4. Oyunu aç
```

---

### Yeşil Logo Hala Var

**Kontrol 1: JS Çalışıyor mu?**
```
F12 Console → Şunu ara:
"[Nexora RP] Logo replacer"
```

**Kontrol 2: CSS Yüklendi mi?**
```javascript
// F12 Console
const el = document.querySelector('.server-info');
console.log(window.getComputedStyle(el).background);
// "transparent" olmalı
```

**Kontrol 3: Hard Restart**
```bash
stop wais-hudv6
start wais-hudv6
```

---

### Cash Hala Senkronize Olmuyor

**Kontrol 1: Event Çalışıyor mu?**
```lua
-- F8
RegisterNetEvent('test:money', function()
    print('Event çalışıyor!')
end)
TriggerEvent('test:money')
```

**Kontrol 2: PlayerData Kontrolü**
```lua
-- F8
local PlayerData = QBCore.Functions.GetPlayerData()
print('Cash:', PlayerData.money.cash)
print('Bank:', PlayerData.money.bank)
```

**Kontrol 3: NUI Message**
```lua
-- F8
SendNUIMessage({
    action = "updateMoney",
    cash = 99999,
    bank = 88888
})
```
HUD'da 99999 ve 88888 görünmeli.

**Kontrol 4: Console Log**
```bash
# VPS'de
tail -f /home/fivem/FXServer/server-data/cache/server.log | grep -i "para\|money\|wais"
```

---

## 📊 Değişiklik Özeti

| Dosya | Değişiklik | Açıklama |
|-------|-----------|----------|
| `logo_remover.js` | Logo replacer'a dönüştürüldü | Yeşil logo → Nexora logosu |
| `style.css` | Display:none kaldırıldı | Background:transparent eklendi |
| `money_sync.lua` | 5 event, 3 sn kontrol | Daha agresif senkronizasyon |

---

## 🎯 Beklenen Sonuç

### Logo
- ✅ Nexora logosu (myLogo.png) görünür
- ✅ Yeşil kare yok
- ✅ Tüm modlarda çalışır
- ✅ Dinamik yükleme destekli

### Cash
- ✅ Para değiştiğinde 100ms içinde güncellenir
- ✅ Her 3 saniyede otomatik kontrol
- ✅ Spawn'da otomatik yüklenir
- ✅ 5 farklı event ile yakalanır
- ✅ `/syncmoney` komutu ile manuel senkronizasyon

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
ls -la /home/fivem/data/myLogo.png  # Logo kontrolü
```

---

## 🔍 Debug

### Logo Debug
```javascript
// F12 Console
document.querySelectorAll('[class*="server"]').forEach(el => {
    console.log('Element:', el);
    console.log('Background:', window.getComputedStyle(el).background);
    console.log('Has logo:', el.querySelector('img') ? 'Yes' : 'No');
});
```

### Cash Debug
```lua
-- F8
RegisterCommand('debugcash', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    print('=== CASH DEBUG ===')
    print('Cash:', PlayerData.money.cash)
    print('Bank:', PlayerData.money.bank)
    print('Last Cash:', lastCash)
    print('Last Bank:', lastBank)
    print('==================')
end, false)
```

---

## 🎯 Sonuç

### Yapılan İşlemler
1. ✅ Logo remover → Logo replacer
2. ✅ myLogo.png entegrasyonu
3. ✅ CSS güncellendi (display:none → background:transparent)
4. ✅ Money sync güçlendirildi (5 event, 3 sn)
5. ✅ Spawn event eklendi
6. ✅ Değişiklik kontrolü eklendi

### Restart Komutu
```bash
restart wais-hudv6
```

### Test
1. Logo: Nexora logosu görünmeli
2. Cash: `/syncmoney` → Para güncellenmeli
3. Console: "[WAIS-HUD] Para güncellendi" görünmeli

**Artık hem logo hem cash çalışmalı!** 🚀
