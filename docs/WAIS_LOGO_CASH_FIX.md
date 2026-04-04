# WAIS-HUD Logo Gizleme ve Cash Para Düzeltmesi

## ✅ Yapılan Değişiklikler

### 1. Yeşil Logo Gizleme
**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/css/style.css`

CSS dosyasının sonuna eklendi:
```css
/* Yeşil logo gizleme - Nexora RP */
.server-info,
.server_info,
[class*="server-info"],
[class*="server_info"],
[class*="ServerInfo"],
.right-corner > div:first-child,
.right-corner-simple > div:first-child {
    display: none !important;
    opacity: 0 !important;
    visibility: hidden !important;
}
```

Bu kod:
- ✅ Yeşil logoyu gizler
- ✅ Diğer bilgileri korur (ID, oyuncu sayısı, meslek, para)
- ✅ Tüm HUD stillerinde çalışır

### 2. Config Ayarları
**Dosya**: `data/resources/[standalone]/wais-hudv6/config.lua`

```lua
Config.DisableRightCorner = false  -- Sağ köşe aktif (sadece logo gizli)
```

**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/Config.json`

```json
"server_infos": {
    "hide": true,
    "disable": true,  // Logo tamamen kapalı
    ...
}

"money": {
    "hide": false,  // Cash görünür
    "disable": false,
    ...
}
```

### 3. Cash Para Ayarları
**Dosya**: `data/resources/[standalone]/wais-hudv6/config.lua`

```lua
Config.MoneySettings = {
    ["name"] = "money",
    ["isItem"] = false,  -- QBCore standart para sistemi
    ["isOldType"] = false,  -- Yeni QBCore versiyonu
    ["qs_inventory"] = false,
    ["ox_inventory"] = false,
}
```

---

## 🔧 Sunucuda Uygulama

### Yöntem 1: Resource Restart (Hızlı)
```
restart wais-hudv6
```

### Yöntem 2: Sunucu Restart (Kesin Çözüm)
FXServer'ı tamamen yeniden başlat.

### Yöntem 3: Cache Temizleme
Eğer hala logo görünüyorsa:
1. Oyunu kapat
2. FiveM cache'ini temizle:
   ```
   %localappdata%\FiveM\FiveM Application Data\cache
   ```
3. Oyunu tekrar aç

---

## 🧪 Test Adımları

### 1. Logo Kontrolü
- ✅ Sağ üstte yeşil kare logo OLMAMALI
- ✅ Player ID görünmeli (#1)
- ✅ Oyuncu sayısı görünmeli (4 Nisan Cmt 20:12)
- ✅ Meslek görünmeli (LS Customs - Manager)
- ✅ Cash görünmeli ($500)
- ✅ Bank görünmeli ($5,006,788)

### 2. Cash Para Kontrolü
- Oyuncunun üzerinde para olmalı
- F8 konsolu aç:
  ```lua
  print(QBCore.Functions.GetPlayerData().money.cash)
  ```
- Çıktı: Para miktarı görünmeli

### 3. HUD Menü Kontrolü
- G tuşuna bas (HUD ayarları)
- Money bölümünde cash görünmeli
- Hide/Disable kapalı olmalı

---

## ⚠️ Sorun Giderme

### Logo Hala Görünüyor
1. **Cache temizle**:
   - Oyunu kapat
   - `%localappdata%\FiveM\FiveM Application Data\cache` klasörünü sil
   - Oyunu aç

2. **CSS dosyasını kontrol et**:
   ```bash
   cat data/resources/[standalone]/wais-hudv6/web/public/css/style.css | tail -n 15
   ```
   Son satırlarda logo gizleme kodu olmalı

3. **Resource restart**:
   ```
   restart wais-hudv6
   ```

### Cash Para Görünmüyor
1. **QBCore kontrolü**:
   ```lua
   -- F8 konsolu
   print(json.encode(QBCore.Functions.GetPlayerData().money))
   ```

2. **Config kontrolü**:
   - `Config.MoneySettings.isItem = false` olmalı
   - `Config.MoneySettings.isOldType = false` olmalı

3. **Config.json kontrolü**:
   ```json
   "money": {
       "hide": false,
       "disable": false
   }
   ```

4. **Inventory kontrolü**:
   - qb-inventory kullanıyorsan `isItem = false`
   - ox_inventory kullanıyorsan `isItem = false`
   - Eski inventory kullanıyorsan `isItem = true`

---

## 📝 Notlar

1. **CSS Yöntemi**: Logo gizleme için CSS kullanıldı çünkü WAIS-HUD encrypted
2. **Config.json**: `server_infos` hem hide hem disable yapıldı (çift güvenlik)
3. **Cash Para**: QBCore standart para sistemi kullanılıyor
4. **Cache**: Değişiklikler görünmüyorsa mutlaka cache temizle

---

## 🎯 Sonuç

- ✅ Yeşil logo gizlendi
- ✅ Diğer bilgiler korundu
- ✅ Cash para ayarları düzeltildi
- ✅ Tüm HUD stilleriyle uyumlu

**Test Et**: Sunucuyu restart et ve kontrol et!
