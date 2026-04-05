# WAIS-HUD Müzik Sistemi Test Rehberi

**Tarih**: 2026-04-06  
**Durum**: ✅ Aktif

## Başarılı Yükleme Mesajları

```
[WAIS-HUD] Entity hata düzeltmesi yüklendi
[WAIS-HUD] xsound entegrasyonu yüklendi (YouTube API bypass)
```

✅ Her iki mesaj da görünüyorsa sistem çalışıyor!

## Müzik Duyulma Sistemi

### 🚗 Araçtayken (Herkes Duyar)

**Nasıl Çalışır**:
```lua
exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
exports.xsound:Distance(musicId, 30.0)
```

**Özellikler**:
- ✅ **30 metre mesafe**: Araç etrafındaki herkes duyar
- ✅ **Camlar kapalı olsa da**: Fiziksel cam kontrolü yok, sadece mesafe
- ✅ **Araç hareket edince**: Ses konumu 0.5 saniyede bir güncellenir
- ✅ **Ses yönü**: Araca yaklaştıkça ses artar, uzaklaştıkça azalır

**Test Senaryosu**:
1. Araca bin (sürücü koltuğu)
2. M tuşuna bas → Müzik sekmesi
3. YouTube URL gir ve çal
4. Başka bir oyuncu araca yaklaşsın
5. 30 metre içinde müziği duymalı

### 🚶 Yayayken (Sadece Sen Duyarsın)

**Nasıl Çalışır**:
```lua
exports.xsound:PlayUrl(musicId, url, volume, false)
```

**Özellikler**:
- ❌ Başkaları duymaz (client-side)
- ✅ Sadece sen duyarsın
- ✅ Kulaklık gibi

## Cam Kontrolü

### Soru: Camlar kapalıyken duyulur mu?

**Cevap**: ✅ EVET, duyulur!

**Neden**:
- xsound fiziksel cam kontrolü yapmaz
- Sadece mesafe kontrolü yapar
- GTA V'nin kendi ses sistemi kullanılmaz

**Gerçekçi Yapmak İsterseniz**:
```lua
-- Cam açık mı kontrol et
local windowOpen = IsVehicleWindowIntact(vehicle, 0) == false

if windowOpen then
    exports.xsound:Distance(musicId, 30.0) -- Camlar açık
else
    exports.xsound:Distance(musicId, 15.0) -- Camlar kapalı (daha az mesafe)
end
```

## Test Adımları

### 1. Tek Oyuncu Testi
1. Araca bin
2. M tuşuna bas
3. Müzik sekmesine tıkla
4. YouTube URL gir: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`
5. Oynat butonuna tıkla
6. Müzik çalmalı

### 2. İki Oyuncu Testi
**Oyuncu 1** (Sürücü):
1. Araca bin
2. Müzik çal

**Oyuncu 2** (Dışarıda):
1. Araca yaklaş (30m içinde)
2. Müziği duymalısın
3. Uzaklaş (30m dışında)
4. Müzik kesilmeli

### 3. Hareket Testi
1. Müzik çalarken araçla hareket et
2. Ses konumu araçla birlikte hareket etmeli
3. Başka oyuncular araca yaklaşınca duymalı

### 4. Araçtan İnme Testi
1. Müzik çalarken araçtan in
2. Müzik otomatik durmalı
3. Console'da: `[WAIS-HUD xsound] Müzik durduruldu`

## Kontroller

### Ses Seviyesi
- M menüsünden slider ile ayarla
- 0% - 100% arası

### Bass Kontrolü
- M menüsünden slider ile ayarla
- -10 ile +10 arası
- Düşük frekansları artırır/azaltır

### Duraklat/Devam
- Duraklat: Müzik durur ama silinmez
- Devam: Kaldığı yerden devam eder

### Durdur
- Müzik tamamen silinir
- Tekrar çalmak için yeni URL gerekir

## Sorun Giderme

### Müzik Çalmıyor
1. xsound yüklü mü? `ensure xsound`
2. Console'da hata var mı?
3. YouTube URL geçerli mi?
4. Araçta mısın?

### Başkaları Duymuyor
1. Araçta mısın? (Yayayken sadece sen duyarsın)
2. 30 metre içinde mi?
3. xsound sunucu tarafında çalışıyor mu?

### Ses Çok Yüksek/Düşük
1. M menüsünden ses seviyesini ayarla
2. Config'de mesafeyi değiştir:
```lua
Config.MusicSystem = {
    ["distance"] = 30.0, -- Buradan değiştir
}
```

## Örnek YouTube URL'leri

```
https://www.youtube.com/watch?v=dQw4w9WgXcQ
https://youtu.be/dQw4w9WgXcQ
https://music.youtube.com/watch?v=dQw4w9WgXcQ
```

## Console Mesajları

### Başarılı
```
[WAIS-HUD xsound] Müzik çalıyor (araç): wais_music_1_1234
[WAIS-HUD xsound] Müzik çalıyor (yaya): wais_music_1_5678
[WAIS-HUD xsound] Ses seviyesi: 0.5
[WAIS-HUD xsound] Bass: 5
[WAIS-HUD xsound] Müzik durduruldu
```

### Hata
```
Error fetching video data: [object Object]  ❌ (Artık olmamalı)
Cannot set properties of null  ❌ (Artık olmamalı)
```

## Özet

✅ **Araçtayken**: Herkes duyar (30m), camlar kapalı olsa da  
✅ **Yayayken**: Sadece sen duyarsın  
✅ **Hareket**: Ses konumu araçla birlikte hareket eder  
✅ **Otomatik Durdurma**: Araçtan inince durur  
✅ **Bass Kontrolü**: -10 ile +10 arası  
✅ **Ses Kontrolü**: 0% - 100% arası

Sistem tamamen çalışıyor, test edebilirsin!
