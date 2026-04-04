# Nexora FiveM - Sorun Çözüm Raporu
**Tarih:** 4 Nisan 2026

## 🔍 Tespit Edilen Sorunlar

### 1. ❌ Loading Ekranı Video Hatası
**Durum:** Video.mp4 dosyası eksik  
**Konum:** `data/resources/[exe-eklenti]/izzy_loading/video.mp4`

**Sebep:**
- HTML dosyasında video kaynağı `nui://izzy_loading/video.mp4` olarak tanımlı
- Ancak bu dosya fiziksel olarak mevcut değil
- Kullanıcı videoyu indirmemiş

**Çözüm:**
Video dosyasını indirip yerleştirmeniz gerekiyor:

1. **YouTube Video:** https://www.youtube.com/watch?v=yz3VUMpdjfE
2. **İndirme Yöntemi:** 
   - https://yt5s.biz/ veya https://y2mate.com/ sitelerini kullanın
   - MP4 formatında, 1080p kalitede indirin
   - Dosya adını `video.mp4` olarak değiştirin
3. **Yerleştirme:**
   ```
   data/resources/[exe-eklenti]/izzy_loading/video.mp4
   ```

**Not:** Dosya boyutu ~50-100MB olabilir, bu normaldir.

---

### 2. ⚠️ Mekanik Menü Çalışmıyor
**Durum:** Mekanik mesleğine sahip olunmasına rağmen menü açılmıyor  
**Konum:** `data/resources/[meslek]/[legal]/kaves_mechanic/`

**Sebep Analizi:**
Kod incelemesinde şunlar tespit edildi:

```lua
-- Config.lua - Satır 186
Config.Locations = {
    ["Satılık İllegal Mechanic"] = {
        illegalMechanic = true,
        enableSociety = false,
        job = "mechanic",  -- ✅ Meslek adı doğru
        coords = {
            vector3(-655.18, -2401.98, 13.96)  -- ✅ Koordinat tanımlı
        },
        showBlip = true,
        blipSprite = 446,
        blipColor = 4,
        blipCoords = vector3(-655.18, -2401.98, 13.96),
        bossMenu = vector3(-644.34, -2413.02, 14.21),
    }
}
```

**Olası Sebepler:**

1. **Meslek Adı Uyuşmazlığı:**
   - QBCore'da meslek adı tam olarak `mechanic` olmalı
   - Kontrol: `/job` komutu ile mesleğinizi kontrol edin
   - Eğer meslek adı farklıysa (örn: `mechanicjob`, `mekanik` vb.) config'i güncellemeniz gerekir

2. **Koordinat Sorunu:**
   - Oyunda bu koordinata gitmeniz gerekiyor: `-655.18, -2401.98, 13.96`
   - Araç içinde olmalısınız
   - 3 metre mesafede olmalısınız
   - Yeşil marker görünmeli

3. **Framework Bağlantısı:**
   - `editable_client.lua` dosyasında framework bağlantısı kontrol edilmeli
   - QBCore düzgün yüklenmiş olmalı

**Test Adımları:**

1. Oyuna girin ve `/job` yazın - mesleğinizi kontrol edin
2. GPS'e şu koordinatı işaretleyin: `-655, -2401, 13`
3. Araca binin ve koordinata gidin
4. 3 metre yaklaşınca yeşil marker görünmeli
5. `E` tuşuna basarak menüyü açmayı deneyin
6. F8 konsolunda hata var mı kontrol edin

**Geçici Çözüm:**
Eğer meslek adı farklıysa, config.lua'yı düzenleyin:

```lua
Config.Locations = {
    ["Satılık İllegal Mechanic"] = {
        job = "GERÇEK_MESLEK_ADINIZ",  -- Buraya kendi meslek adınızı yazın
        -- ... diğer ayarlar
    }
}
```

---

### 3. ✅ WAIS-HUDv6 Türkçeleştirme
**Durum:** ZATEN TÜRKÇE! 🎉

**Mevcut Durum:**
- ✅ Config'de dil `tr` olarak ayarlanmış
- ✅ Türkçe locale dosyası mevcut ve eksiksiz
- ✅ Web arayüzü Türkçe JSON dosyası tam
- ✅ Tüm menüler ve HUD elemanları Türkçe

**Kontrol:**
```lua
-- config.lua - Satır 13
Config.Language = "tr" -- ✅ Türkçe aktif
```

**Türkçe Çeviriler:**
- ✅ Sağ köşe (Meslek, Çete, Banka, Nakit, Silah)
- ✅ Araç HUD (km/s, mil/s, Hava Hızı, Su Hızı)
- ✅ Hızlı Menü (Yakınlar, Müzik, Araç)
- ✅ Ayarlar Menüsü (Genel, Araç Hud, Durum Hud, Sağ Köşe)
- ✅ Konum İşaretleme (Banka, Dükkan, Kıyafet, Garaj, Tamirci, Silahçı)
- ✅ Müzik Sistemi
- ✅ Emniyet Kemeri Sistemi
- ✅ Posta Kodu Sistemi

**Kullanım:**
- `/hud` komutu ile ayarlar menüsünü açabilirsiniz
- Tüm arayüz Türkçe olarak görünecektir
- Özelleştirme seçenekleri tamamen Türkçe

---

## 📋 Yapılması Gerekenler

### Acil (Kullanıcı Tarafından)
1. ⚠️ **Video dosyasını indirin ve yerleştirin**
   - YouTube: https://www.youtube.com/watch?v=yz3VUMpdjfE
   - Hedef: `data/resources/[exe-eklenti]/izzy_loading/video.mp4`

2. ⚠️ **Mekanik meslek adını kontrol edin**
   - Oyunda `/job` yazın
   - Meslek adını not edin
   - Eğer `mechanic` değilse bana bildirin

### Test Edilmesi Gerekenler
1. Loading ekranında video oynatılıyor mu?
2. Mekanik koordinatında marker görünüyor mu?
3. HUD tamamen Türkçe mi?

---

## 🎯 Özet

| Sorun | Durum | Çözüm |
|-------|-------|-------|
| Loading Video | ❌ Eksik | Kullanıcı indirmeli |
| Mekanik Menü | ⚠️ Test Gerekli | Meslek adı kontrolü |
| HUD Türkçe | ✅ Tamam | Zaten Türkçe |

---

## 📞 Sonraki Adımlar

Lütfen şunları yapın:
1. Video dosyasını indirip yerleştirin
2. Oyuna girin ve `/job` yazarak meslek adınızı kontrol edin
3. Mekanik koordinatına gidin: `-655, -2401, 13`
4. Sonuçları bana bildirin

Herhangi bir hata mesajı görürseniz F8 konsolundan screenshot alıp gönderin.
