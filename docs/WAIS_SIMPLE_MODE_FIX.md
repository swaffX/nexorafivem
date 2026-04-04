# WAIS-HUD Simple Mode Logo ve Cash Düzeltmesi

## 🎯 Sorun

- ✅ Yeşil kare logo sadece `/hud` menüsünde "Simple" modunda görünüyor
- ✅ Diğer modlarda (Modern, Boxed Dynamic, Old) logo yok
- ✅ Cash para tüm modlarda görünmüyor

## ✅ Çözüm

### 1. Logo Gizleme (Simple Mode)

**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/css/style.css`

CSS dosyasının sonuna eklendi:
```css
/* Yeşil logo gizleme - Nexora RP */
/* Sadece simple modda görünen yeşil kare logo için */
.server-info,
.server_info,
[class*="server-info"],
[class*="server_info"],
[class*="ServerInfo"],
.right-corner > div:first-child,
.right-corner-simple > div:first-child,
.simple-mode .server-info,
.simple-mode .server_info {
    display: none !important;
    opacity: 0 !important;
    visibility: hidden !important;
    width: 0 !important;
    height: 0 !important;
    pointer-events: none !important;
}
```

### 2. Config Ayarları

**Dosya**: `data/resources/[standalone]/wais-hudv6/web/public/Config.json`

```json
{
    "customizations": {
        "rightCorner": {
            "style": "simple",  // ← Şu an simple moddasın
            "elements_behaviors": {
                "server_infos": {
                    "hide": true,      // ✅ Logo gizli
                    "disable": true    // ✅ Logo devre dışı
                },
                "money": {
                    "hide": false,     // ✅ Cash görünür
                    "disable": false   // ✅ Cash aktif
                },
                "bank": {
                    "hide": false,     // ✅ Bank görünür
                    "disable": false   // ✅ Bank aktif
                }
            }
        }
    }
}
```

### 3. Cash Para Ayarları

**Dosya**: `data/resources/[standalone]/wais-hudv6/config.lua`

```lua
Config.MoneySettings = {
    ["name"] = "money",
    ["isItem"] = false,      -- QBCore standart para (PlayerData.money.cash)
    ["isOldType"] = false,   -- Yeni QBCore versiyonu
    ["qs_inventory"] = false,
    ["ox_inventory"] = false,
}
```

---

## 🔄 Uygulama Adımları

### 1. Sunucuda Resource Restart
```bash
restart wais-hudv6
```

### 2. Oyunda Test
1. `/hud` komutunu yaz
2. "Simple" moduna geç
3. Yeşil logo OLMAMALI
4. Cash ve Bank görünmeli

### 3. Cache Temizleme (Gerekirse)
Eğer hala logo görünüyorsa:
```
1. Oyunu kapat
2. %localappdata%\FiveM\FiveM Application Data\cache klasörünü sil
3. Oyunu tekrar aç
```

---

## 🧪 Test Senaryoları

### Test 1: Simple Mode
```
1. /hud yaz
2. "Simple" modunu seç
3. Kontrol et:
   ✅ Yeşil logo YOK
   ✅ Player ID var (#1)
   ✅ Oyuncu sayısı var (4 Nisan)
   ✅ Meslek var (LS Customs - Manager)
   ✅ Cash var ($500)
   ✅ Bank var ($5,006,788)
```

### Test 2: Modern Mode
```
1. /hud yaz
2. "Modern" modunu seç
3. Kontrol et:
   ✅ Logo zaten yok (orijinal tasarım)
   ✅ Cash ve Bank görünüyor
```

### Test 3: Boxed Dynamic Mode
```
1. /hud yaz
2. "Boxed Dynamic" modunu seç
3. Kontrol et:
   ✅ Logo zaten yok (orijinal tasarım)
   ✅ Cash ve Bank görünüyor
```

### Test 4: Old Mode
```
1. /hud yaz
2. "Old" modunu seç
3. Kontrol et:
   ✅ Logo zaten yok (orijinal tasarım)
   ✅ Cash ve Bank görünüyor
```

---

## 🐛 Sorun Giderme

### Logo Hala Görünüyor (Simple Mode)

**Çözüm 1: Cache Temizle**
```
1. Oyunu kapat
2. %localappdata%\FiveM\FiveM Application Data\cache
3. Klasörü sil
4. Oyunu aç
```

**Çözüm 2: CSS Kontrolü**
```bash
# VPS'de
tail -n 20 /home/fivem/data/resources/[standalone]/wais-hudv6/web/public/css/style.css
```
Son satırlarda logo gizleme kodu olmalı.

**Çözüm 3: Hard Restart**
```bash
# VPS'de
restart wais-hudv6
# Veya
ensure wais-hudv6
```

### Cash Para Görünmüyor

**Kontrol 1: QBCore Para Kontrolü**
```lua
-- F8 konsolu
print(json.encode(QBCore.Functions.GetPlayerData().money))
```
Çıktı:
```json
{
    "cash": 500,
    "bank": 5006788
}
```

**Kontrol 2: Config.json**
```json
"money": {
    "hide": false,  // ← false olmalı
    "disable": false  // ← false olmalı
}
```

**Kontrol 3: HUD Menü**
```
1. /hud yaz
2. "Money" sekmesine git
3. "Hide" kapalı olmalı
4. "Disable" kapalı olmalı
```

**Kontrol 4: MoneySettings**
```lua
-- config.lua
Config.MoneySettings = {
    ["isItem"] = false,  -- ← false olmalı (QBCore standart)
    ["isOldType"] = false  -- ← false olmalı (yeni QBCore)
}
```

### Cash Var Ama Görünmüyor

**Sebep**: HUD menüsünde money elementi gizlenmiş olabilir.

**Çözüm**:
```
1. /hud yaz
2. "Money" elementine git
3. "Show" butonuna tıkla
4. Kaydet
```

---

## 📊 Mod Karşılaştırması

| Mod | Logo Sorunu | Cash Sorunu | Çözüm |
|-----|-------------|-------------|-------|
| Simple | ✅ Vardı | ✅ Vardı | ✅ Düzeltildi |
| Modern | ❌ Yoktu | ✅ Vardı | ✅ Düzeltildi |
| Boxed Dynamic | ❌ Yoktu | ✅ Vardı | ✅ Düzeltildi |
| Old | ❌ Yoktu | ✅ Vardı | ✅ Düzeltildi |

---

## 🎯 Sonuç

### Yapılan Değişiklikler
1. ✅ CSS ile simple mode logosu gizlendi
2. ✅ Config.json'da server_infos disable edildi
3. ✅ Config.json'da money/bank aktif edildi
4. ✅ Config.lua'da MoneySettings doğru ayarlandı

### Beklenen Sonuç
- ✅ Simple modda yeşil logo YOK
- ✅ Tüm modlarda cash ve bank GÖRÜNÜYOR
- ✅ Diğer bilgiler korundu (ID, oyuncu sayısı, meslek)

### Test Komutu
```
restart wais-hudv6
```

Sunucuyu restart et ve `/hud` ile simple moda geç. Logo kaybolmalı, cash görünmeli! 🚀
