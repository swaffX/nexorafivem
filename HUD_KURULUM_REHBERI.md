# wais-hudv6 HUD Kurulum ve Sorun Giderme Rehberi

## ✅ Yapılan Değişiklikler

1. **server.cfg güncellendi** - wais-hudv6 başlatıldı
2. **alan-hud devre dışı bırakıldı** - HUD çakışmasını önlemek için
3. **xsound dependency yoruma alındı** - Eksik dependency hatası önlendi

## 🚀 Kurulum Adımları

### 1. Server.cfg Kontrolü

`data/server.cfg` dosyasında şu satırların olduğundan emin olun:

```cfg
start ox_lib
ensure qb-core

# HUD System
# ensure [alan]  # alan-hud kapatıldı
start wais-hudv6

ensure [qb]
ensure [standalone]
```

### 2. Diğer HUD'ları Devre Dışı Bırakın

Aynı anda birden fazla HUD çalışmamalı. Kontrol edin:

```bash
# alan-hud kapalı olmalı
# ensure [alan] satırı yorumda olmalı veya silinmeli
```

### 3. Gerekli Dependency'leri Kontrol Edin

wais-hudv6 için gerekli:
- ✅ ox_lib (var)
- ⚠️ xsound (opsiyonel - müzik sistemi için)

### 4. xsound Kurulumu (Opsiyonel)

Eğer araç içi müzik sistemini kullanmak istiyorsanız:

```bash
cd data/resources/[standalone]
git clone https://github.com/Xogy/xsound.git
```

Sonra `server.cfg`'ye ekleyin:
```cfg
ensure xsound
start wais-hudv6
```

Ve `wais-hudv6/fxmanifest.lua`'da xsound yorumunu kaldırın:
```lua
dependencys {
    'xsound',  -- Yorumu kaldırın
    'ox_lib',
}
```

## 🔧 Sorun Giderme

### HUD Hala Görünmüyor?

**1. Sunucuyu Yeniden Başlatın**
```bash
# Sunucuyu tamamen kapatıp açın (restart değil!)
```

**2. F8 Konsolu Kontrol Edin**
```
F8 tuşuna basın ve hata mesajlarını kontrol edin
```

**3. Resource Durumunu Kontrol Edin**
```
F8 konsolu açın ve yazın:
restart wais-hudv6
```

**4. Diğer HUD'ları Tamamen Kapatın**

`data/resources/[alan]/alan-hud` klasörünü geçici olarak başka bir yere taşıyın:
```bash
mv data/resources/[alan]/alan-hud data/resources/alan-hud-backup
```

**5. Config Ayarlarını Kontrol Edin**

`data/resources/[standalone]/wais-hudv6/config.lua` dosyasını açın:

```lua
Config.Framework = {
    ["Framework"] = "auto", -- veya "qbcore"
    ["ResourceName"] = "auto", -- veya "qb-core"
}
```

**6. Keybind Ayarlarını Kontrol Edin**

Oyunda: ESC > Settings > Key Bindings > FiveM

Şu komutları arayın:
- `hud` - HUD ayarlarını açmak için (varsayılan: G)
- `editormode` - Editor modunu açmak için (varsayılan: PageUp)
- `belt` - Emniyet kemeri (varsayılan: B)
- `carcontrol` - Araç kontrolü (varsayılan: M)

### Sık Karşılaşılan Hatalar

**Hata: "Failed to load script"**
- ox_lib'in yüklü ve çalıştığından emin olun
- `ensure ox_lib` satırının `start wais-hudv6`'dan önce olduğundan emin olun

**Hata: "xsound not found"**
- xsound'u kurun VEYA
- `fxmanifest.lua`'da xsound satırını yoruma alın (zaten yapıldı)

**HUD Görünüyor Ama Çalışmıyor**
- F8 konsolu açın ve `restart wais-hudv6` yazın
- Karakterinizi yeniden spawn edin: `/revive` veya sunucudan çıkıp girin

**Minimap Görünmüyor**
- Config'de `Config.ShowMapOnFoot = true` olduğundan emin olun
- Araçtayken minimap görünüyor mu kontrol edin

## 🎮 HUD Kullanımı

### Komutlar

- `/hud` - HUD ayarlarını aç (veya G tuşu)
- `/editormode` - Editor modunu aç (veya PageUp)
- `/carcontrol` - Araç kontrol menüsünü aç (veya M tuşu)
- `/cinematic` - Sinematik modu aç/kapat
- `/postal [kod]` - Postal kodu işaretle

### Tuşlar

- **B** - Emniyet kemeri tak/çıkar
- **G** - HUD ayarları
- **M** - Araç kontrol menüsü (araçtayken)
- **PageUp** - Editor modu

## ⚙️ Özelleştirme

### HUD Pozisyonunu Değiştirme

1. Oyunda `/editormode` yazın veya PageUp'a basın
2. HUD elementlerini sürükleyerek istediğiniz yere taşıyın
3. Tekrar PageUp'a basarak kaydedin

### Dil Değiştirme

`config.lua` dosyasında:
```lua
Config.Language = "tr" -- Türkçe için
```

Desteklenen diller: ar, cz, ro, it, fr, de, tr, en

### Framework Ayarları

```lua
Config.Framework = {
    ["Framework"] = "qbcore", -- veya "esx"
    ["ResourceName"] = "qb-core", -- veya "es_extended"
}
```

## 📊 Performans Optimizasyonu

Config'de refresh sürelerini ayarlayabilirsiniz:

```lua
Config.RefreshTimes = {
    ["carhud"] = {
        ["balanced"] = 200,  -- Daha yüksek = daha az resmon
        ["performance"] = 100,
    },
    ["status"] = {
        ["balanced"] = 250,
        ["performance"] = 100,
    },
}
```

## 🆘 Hala Çalışmıyor mu?

1. Sunucu loglarını kontrol edin
2. F8 konsolu hatalarını kontrol edin
3. `ensure ox_lib` ve `start wais-hudv6` sırasının doğru olduğundan emin olun
4. Tüm HUD scriptlerini kapatıp sadece wais-hudv6'yı açın
5. Temiz bir sunucu restart yapın (stop + start)

## 📝 Kontrol Listesi

- [ ] ox_lib yüklü ve çalışıyor
- [ ] wais-hudv6 server.cfg'de başlatılmış
- [ ] Diğer HUD'lar kapatılmış (alan-hud vb.)
- [ ] Sunucu tamamen yeniden başlatıldı
- [ ] F8 konsolunda hata yok
- [ ] Keybind ayarları yapıldı
- [ ] Config.lua framework ayarları doğru

## 🔗 Yararlı Linkler

- [ox_lib GitHub](https://github.com/overextended/ox_lib)
- [xsound GitHub](https://github.com/Xogy/xsound)
- [wais-hudv6 Discord](https://discord.gg/0resmon)
