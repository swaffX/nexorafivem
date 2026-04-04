# qb-customs Kurulum Rehberi

## 📥 İndirme ve Kurulum

### VPS'de (SSH ile)

```bash
# Meslek klasörüne git
cd /home/fivem/data/resources/[meslek]/[legal]

# GitHub'dan indir
git clone https://github.com/im-not-here-bro/qb-customs.git

# Klasör adını kontrol et
ls -la qb-customs/

# İzinleri ayarla
chmod -R 755 qb-customs/
```

### Windows'tan (Manuel)

1. **GitHub'dan indir**
   - https://github.com/im-not-here-bro/qb-customs
   - "Code" → "Download ZIP"

2. **Çıkart**
   - ZIP'i aç
   - `qb-customs-main` klasörünü `qb-customs` olarak yeniden adlandır

3. **VPS'e yükle**
   - FileZilla veya WinSCP ile
   - `/home/fivem/data/resources/[meslek]/[legal]/qb-customs/`

---

## ⚙️ Yapılandırma

### 1. Config Dosyası

`qb-customs/config.lua` dosyasını düzenle:

```lua
Config = {}

Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Mekanik komisyonu (10%)

Config.Locations = {
    ["bennys"] = {
        ["Zone"] = {
            ["Shape"] = {
                vector2(-212.55, -1320.56),
                vector2(-204.83, -1329.35),
                vector2(-220.09, -1338.58),
                vector2(-227.81, -1329.79)
            },
            ["minZ"] = 29.0,
            ["maxZ"] = 32.0
        },
        ["Job"] = "mechanic", -- Sadece mekanikler
        ["Blip"] = {
            ["Sprite"] = 446,
            ["Color"] = 5,
            ["Scale"] = 0.8,
            ["Label"] = "Bennys Customs"
        }
    },
    ["lscustoms"] = {
        ["Zone"] = {
            ["Shape"] = {
                vector2(-365.84, -130.81),
                vector2(-352.47, -117.44),
                vector2(-339.10, -130.81),
                vector2(-352.47, -144.18)
            },
            ["minZ"] = 37.0,
            ["maxZ"] = 40.0
        },
        ["Job"] = "mechanic",
        ["Blip"] = {
            ["Sprite"] = 446,
            ["Color"] = 5,
            ["Scale"] = 0.8,
            ["Label"] = "LS Customs"
        }
    }
}
```

### 2. Herkes Kullanabilsin (Opsiyonel)

Eğer herkesin kullanmasını istiyorsan:

```lua
["Job"] = false, -- false = herkes kullanabilir
```

---

## 🗄️ SQL Kurulumu

### SQL Dosyası Var mı Kontrol Et

```bash
# VPS'de
ls -la /home/fivem/data/resources/[meslek]/[legal]/qb-customs/*.sql
```

Eğer SQL dosyası varsa:

```bash
# SQL'i yükle
mysql -u nexora -p'Nexora123!' temelpaket < /home/fivem/data/resources/[meslek]/[legal]/qb-customs/qb-customs.sql
```

---

## 🔧 Server.cfg

`data/server.cfg` dosyasına ekleme yapma! Zaten `ensure [meslek]` ile otomatik yükleniyor.

Ama kontrol için:

```cfg
# Jobs / Meslekler
ensure [meslek]
```

---

## 🚀 Başlatma

### VPS'de

```bash
# Sunucuyu restart et
restart qb-customs

# Veya tüm meslek scriptlerini
restart [meslek]

# Veya sunucuyu tamamen restart
# Ctrl+C sonra tekrar başlat
```

---

## 🧪 Test

### 1. Oyunda Kontrol

```
1. Bennys Workshop'a git (-211, -1324, 30)
2. Aracınla içeri gir
3. E tuşu veya qb-target ile menü açılmalı
```

### 2. Console Kontrolü

```bash
# VPS'de
tail -f /home/fivem/FXServer/server-data/cache/server.log | grep -i customs
```

Şunu görmeli:
```
[qb-customs] Resource started
```

### 3. F8 Kontrolü (Oyunda)

```
resmon
```

`qb-customs` listede görünmeli ve 0.00-0.05ms resmon olmalı.

---

## 📋 Özellikler

### Menü İçeriği
- 🎨 Boya (Primary, Secondary, Pearlescent)
- 🛞 Jantlar (Wheels, Custom Wheels)
- 💡 Farlar (Xenon, Neon)
- 🪟 Camlar (Window Tint)
- 🔧 Performans (Engine, Brakes, Transmission, Suspension)
- 🚀 Turbo
- 🛡️ Armor (Zırh)
- 🎺 Korna
- 🏁 Livery (Kaplama)
- 🎭 Extras (Ekstralar)

### Ödeme Sistemi
- Nakit veya banka kartı
- Mekanik komisyonu (Config.Commission)
- QBCore para sistemi entegreli

---

## ⚠️ Sorun Giderme

### Script Başlamıyor

**Kontrol 1: Klasör Adı**
```bash
ls -la /home/fivem/data/resources/[meslek]/[legal]/
```
`qb-customs` olmalı, `qb-customs-main` değil!

**Kontrol 2: fxmanifest.lua**
```bash
cat /home/fivem/data/resources/[meslek]/[legal]/qb-customs/fxmanifest.lua
```
Dosya olmalı.

**Kontrol 3: İzinler**
```bash
chmod -R 755 /home/fivem/data/resources/[meslek]/[legal]/qb-customs/
```

---

### Menü Açılmıyor

**Kontrol 1: Job**
```lua
-- F8
print(QBCore.Functions.GetPlayerData().job.name)
```
`mechanic` olmalı (eğer config'de job = "mechanic" ise)

**Kontrol 2: qb-target**
```
resmon
```
`qb-target` çalışıyor mu?

**Kontrol 3: Koordinat**
```lua
-- F8
local coords = GetEntityCoords(PlayerPedId())
print(coords)
```
Bennys içinde misin? (-211, -1324, 30)

---

### SQL Hatası

**Kontrol: Tablo Var mı?**
```bash
mysql -u nexora -p'Nexora123!' temelpaket -e "SHOW TABLES LIKE 'player_vehicles';"
```

qb-customs genelde mevcut tabloları kullanır, yeni tablo oluşturmaz.

---

## 🎯 Hızlı Kurulum (Özet)

```bash
# 1. İndir
cd /home/fivem/data/resources/[meslek]/[legal]
git clone https://github.com/im-not-here-bro/qb-customs.git

# 2. İzinleri ayarla
chmod -R 755 qb-customs/

# 3. Config düzenle (opsiyonel)
nano qb-customs/config.lua

# 4. SQL yükle (varsa)
mysql -u nexora -p'Nexora123!' temelpaket < qb-customs/qb-customs.sql

# 5. Restart
restart qb-customs
```

---

## 📞 Komutlar

### VPS'de
```bash
restart qb-customs
ensure qb-customs
refresh
```

### Oyunda
```
/setjob [ID] mechanic 0  # Mekanik yap
```

---

## 🎯 Sonuç

✅ qb-customs GitHub'dan indirildi
✅ [meslek]/[legal] klasörüne yerleştirildi
✅ Config düzenlendi
✅ SQL yüklendi (varsa)
✅ Sunucu restart edildi

Bennys Workshop'a git ve test et! 🚗
