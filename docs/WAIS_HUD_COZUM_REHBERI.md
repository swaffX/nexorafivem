# WAIS-HUD Sorun Çözüm Rehberi
**Tarih:** 4 Nisan 2026  
**Durum:** ✅ Konum İsmi Düzeltildi | ⚠️ Blip ve Müzik Sistemi Analiz Edildi

---

## ✅ TAMAMLANAN: Konum İsmi Sorunu

### Sorun
Haritanın üstünde "Posta Yakını" yazısı donmuş durumda kalıyordu ve bulunulan yerin gerçek ismi (sokak/bölge adı) gösterilmiyordu.

### Çözüm
`data/resources/[standalone]/wais-hudv6/client/client.lua` dosyasında sokak isimleri kasıtlı olarak kaldırılmıştı. Geri ekledim.

### Yapılan Değişiklik
```lua
-- ÖNCESİ:
local streetName = "" -- Removed
local crossingName = "" -- Removed

-- SONRASI:
local streetName = GetStreetNameFromHashKey(streetHash)
local crossingName = GetStreetNameFromHashKey(crossingHash)

-- Eğer sokak ismi yoksa bölge ismini göster
if streetName == "" or streetName == nil then
    local zoneHash = GetNameOfZone(coords.x, coords.y, coords.z)
    streetName = GetLabelText(zoneHash)
end
```

### Test Etmek İçin
1. Sunucuyu restart et: `restart wais-hudv6`
2. Oyuna gir ve haritayı aç
3. Farklı yerlere git ve üstteki yazının değiştiğini gör

---

## ⚠️ BLIP KONUMLANDIRMA SORUNU

### Sorun
Harita üzerindeki blip'ler (işaretçiler) haritanın sağ alt ve sol alt köşelerinde takılı kalıyor. Gerçek konum uzakta olmasına rağmen blip'ler harita kenarlarında görünüyor.

### Analiz Sonucu
**Bu sorun WAIS-HUD'dan kaynaklanmıyor!**

WAIS-HUD sadece harita görünümünü yönetiyor (kare/daire, pozisyon, zoom). Blip'leri oluşturan ve konumlandıran başka bir script var.

### Olası Nedenler

#### 1. Minimap Pozisyon Sorunu
WAIS-HUD'ın minimap pozisyonlama sistemi bazı ekran çözünürlüklerinde sorun yaratabilir.

**Kontrol:**
```lua
-- config.lua içinde desteklenen çözünürlükler:
Config.MapFactor = {
    ["1280x720"] = {...},
    ["1366x768"] = {...},
    ["1920x1080"] = {...},
    ["2560x1440"] = {...}
}
```

**Senin ekran çözünürlüğün nedir?**
- F8 konsola yaz: `/print GetActiveScreenResolution()`
- Eğer yukarıdaki listede yoksa, minimap yanlış konumlanıyor olabilir

#### 2. Blip Oluşturan Scriptler
Şu scriptler blip oluşturuyor olabilir:
- `qb-target` (hedef sistemi)
- `qb-garages` (garaj blipleri)
- `qb-shops` (dükkan blipleri)
- `qb-policejob` (polis blipleri)
- `qb-ambulancejob` (hastane blipleri)
- Meslek scriptleri (`kaves_mechanic`, `hb_farming`, vb.)

### Çözüm Adımları

#### ADIM 1: Ekran Çözünürlüğünü Kontrol Et
```lua
-- F8 konsola yaz:
/print GetActiveScreenResolution()
```

Eğer çözünürlüğün `1280x720`, `1366x768`, `1920x1080` veya `2560x1440` değilse:

**config.lua'ya ekle:**
```lua
-- Örnek: 1600x900 için
["1600x900"] = {
    ["square"] = {
        ["x"] = 1.65,
        ["y"] = 850,
    },
    ["circle"] = {
        ["x"] = 1.65,
        ["y"] = 875,
    }
}
```

#### ADIM 2: Blip Oluşturan Scripti Bul
```lua
-- F8 konsola yaz ve blip'e bak:
/resmon

-- Yüksek resmon kullanan scriptleri not et
-- Sonra o scriptlerin client.lua dosyalarında "AddBlipForCoord" ara
```

#### ADIM 3: Blip Kodunu Kontrol Et
Blip oluşturan scriptte şu kontrolleri yap:

```lua
-- YANLIŞ (blip ekran dışına çıkabilir):
local blip = AddBlipForCoord(x, y, z)
SetBlipSprite(blip, sprite)

-- DOĞRU (blip ekranda kalır):
local blip = AddBlipForCoord(x, y, z)
SetBlipSprite(blip, sprite)
SetBlipDisplay(blip, 4) -- Minimap ve büyük haritada göster
SetBlipScale(blip, 0.8) -- Boyut
SetBlipAsShortRange(blip, true) -- Uzakta gizle
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("İsim")
EndTextCommandSetBlipName(blip)
```

#### ADIM 4: Minimap Zoom Kontrolü
```lua
-- client.lua'da şu satırı bul:
SetRadarZoom(1100)

-- Farklı değerler dene:
SetRadarZoom(900)  -- Daha yakın
SetRadarZoom(1100) -- Normal
SetRadarZoom(1300) -- Daha uzak
```

### Hızlı Test
Blip sorununu test etmek için:

1. F8 konsola yaz:
```lua
/blip
```

2. Eğer `/blip` komutu yoksa, şunu dene:
```lua
-- F8 konsola yapıştır:
local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
local blip = AddBlipForCoord(x + 100.0, y + 100.0, z)
SetBlipSprite(blip, 1)
SetBlipDisplay(blip, 4)
SetBlipScale(blip, 1.0)
SetBlipColour(blip, 2)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Test Blip")
EndTextCommandSetBlipName(blip)
```

3. Haritayı aç ve "Test Blip" yazısını ara
4. Eğer bu blip de köşede görünüyorsa, sorun minimap pozisyonunda
5. Eğer bu blip doğru görünüyorsa, sorun diğer scriptlerin blip kodunda

---

## ⚠️ MÜZİK SİSTEMİ SORUNU

### Sorun
M tuşuna basınca açılan menüden şarkı açılıyor ama etraftaki oyuncuların duyup duymadığı bilinmiyor.

### Analiz Sonucu
**MÜZİK SİSTEMİ SENKRONIZE DEĞİL!**

Müzik sadece şarkıyı açan oyuncunun bilgisayarında çalıyor. Etraftaki oyuncular duymuyor.

### Neden?
1. **xSound resource'u yok:** Sunucuda `xsound` resource'u kurulu değil
2. **Client-side oynatma:** Müzik sadece lokal olarak çalıyor
3. **Senkronizasyon yok:** Diğer oyunculara müzik bilgisi gönderilmiyor

### Çözüm Seçenekleri

#### SEÇENEK 1: xSound Kur (ÖNERİLEN)

**1. xSound'u İndir:**
```bash
# GitHub'dan indir:
https://github.com/Xogy/xsound

# veya
git clone https://github.com/Xogy/xsound.git
```

**2. Kurulum:**
```bash
# xsound klasörünü şuraya kopyala:
data/resources/[standalone]/xsound/

# veya
data/resources/xsound/
```

**3. server.cfg'ye Ekle:**
```cfg
# xSound'u wais-hudv6'dan ÖNCE başlat
ensure xsound
ensure wais-hudv6
```

**4. Sunucuyu Restart Et:**
```bash
restart xsound
restart wais-hudv6
```

**5. Test Et:**
- Oyuna gir
- Arabaya bin
- M tuşuna bas
- Şarkı aç
- Başka bir oyuncuya yaklaş
- Şarkıyı duyup duymadığını sor

#### SEÇENEK 2: Müzik Sistemini Kapat

Eğer xSound kurmak istemiyorsan:

**config.lua'yı düzenle:**
```lua
Config.MusicSystem = {
    ["disable"] = true, -- false yerine true yap
    ["distance"] = 10.0,
}
```

**Sunucuyu restart et:**
```bash
restart wais-hudv6
```

Artık M menüsünde müzik seçeneği görünmeyecek.

#### SEÇENEK 3: Alternatif Müzik Sistemi

xSound yerine başka bir müzik sistemi kullanabilirsin:
- `dpemotes` (dans + müzik)
- `xsound-fork` (xSound'un güncel versiyonu)
- `qb-radio` (radyo sistemi)

---

## 📊 DURUM ÖZET

| Sorun | Durum | Çözüm |
|-------|-------|-------|
| ✅ Konum ismi donuyor | ÇÖZÜLDÜ | Sokak isimleri geri eklendi |
| ⚠️ Blip konumlandırma | ANALİZ EDİLDİ | Ekran çözünürlüğü ve blip scriptleri kontrol edilmeli |
| ⚠️ Müzik senkronizasyonu | ANALİZ EDİLDİ | xSound kurulmalı veya sistem kapatılmalı |

---

## 🔧 YAPILACAKLAR

### Hemen Yapılabilir
1. ✅ Sunucuyu restart et: `restart wais-hudv6` (konum ismi düzeltmesi için)
2. ⚠️ Ekran çözünürlüğünü kontrol et (blip sorunu için)
3. ⚠️ xSound kur veya müzik sistemini kapat

### Araştırma Gerekli
1. ⚠️ Blip oluşturan scripti bul (`/resmon` ile)
2. ⚠️ Blip kodunu kontrol et (SetBlipDisplay, SetBlipAsShortRange)
3. ⚠️ Minimap zoom değerini ayarla

---

## 📞 DESTEK

Eğer sorunlar devam ederse:

1. **Ekran çözünürlüğünü söyle** (F8: `/print GetActiveScreenResolution()`)
2. **Blip testi yap** (yukarıdaki test kodunu çalıştır)
3. **xSound kurulum durumunu belirt** (kurulu mu, değil mi)
4. **Hangi scriptlerin yüksek resmon kullandığını söyle** (`/resmon`)

---

**Hazırlayan:** Kiro AI Assistant  
**Tarih:** 4 Nisan 2026  
**Versiyon:** 1.0
