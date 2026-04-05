# Nexora Araç Hoparlör Sistemi Kurulumu

**Tarih**: 2026-04-05  
**Durum**: ✅ Tamamlandı

## Özellikler

### 🎵 Müzik Sistemi
- YouTube URL ile müzik çalma
- Araç hoparlöründen ses (herkes duyar)
- Mesafe bazlı ses sistemi (30m)
- xsound entegrasyonu

### 🎚️ Ses Kontrolleri
- **Ses Seviyesi**: 0-100% slider
- **Bass**: -10 ile +10 arası (düşük frekanslar)
- **Tiz**: -10 ile +10 arası (yüksek frekanslar)
- **Oynat/Duraklat/Durdur**: Tam kontrol

### 📝 Playlist
- Son çalınan şarkılar kaydedilir
- Geçmiş şarkılara tıklayarak tekrar çal
- Playlist temizleme özelliği

### 🎨 Modern UI
- Glassmorphism tasarım
- Gradient renkler
- Smooth animasyonlar
- Responsive tasarım

## Dosya Yapısı

```
nexora-carradio/
├── fxmanifest.lua
├── config.lua
├── client.lua
├── server.lua
├── README.md
└── html/
    ├── index.html
    ├── style.css
    └── script.js
```

## Kurulum

### 1. Resource Konumu
```
data/resources/[standalone]/nexora-carradio/
```

### 2. Server.cfg
Zaten `ensure [standalone]` var, otomatik yüklenecek.

### 3. Bağımlılıklar
- ✅ qb-core (zaten var)
- ✅ xsound (zaten var)

## Kullanım

### Menüyü Açma
**Araçtayken K tuşuna bas**

veya

```
/carradio
```

### Müzik Çalma
1. YouTube URL'sini kopyala
2. K tuşuna bas
3. URL'yi yapıştır
4. "Çal" butonuna tıkla

### Ses Ayarları
- **Ses Seviyesi**: Slider'ı kaydır
- **Bass**: Düşük frekansları artır/azalt
- **Tiz**: Yüksek frekansları artır/azalt

## Özellik Detayları

### Bass Kontrolü
- **-10**: Minimum bass (düz ses)
- **0**: Normal bass
- **+10**: Maksimum bass (güçlü bas)

### Tiz Kontrolü
- **-10**: Minimum tiz (yumuşak ses)
- **0**: Normal tiz
- **+10**: Maksimum tiz (keskin ses)

### Mesafe Sistemi
- **Araç içi**: 30 metre mesafeden duyulur
- **Yaya**: 10 metre mesafeden duyulur
- Araçtan inince müzik otomatik durur

## Teknik Notlar

### xsound Entegrasyonu
```lua
exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
exports.xsound:setBassGain(musicId, bassValue)
exports.xsound:Distance(musicId, distance)
```

### Entity Kontrolü
- Araç entity kontrolü yapılır
- Araçtan inince müzik durdurulur
- Menü otomatik kapanır

### Playlist Sistemi
- Son 10 şarkı gösterilir
- Şarkılara tıklayarak tekrar çalınabilir
- Temizleme özelliği var

## Test Adımları

1. Sunucuyu restart et:
```bash
restart nexora-carradio
```

2. Oyuna gir ve araca bin
3. K tuşuna bas
4. YouTube URL'si gir ve çal
5. Bass/Tiz ayarlarını test et
6. Araçtan in (müzik durmalı)

## Örnek YouTube URL'leri

```
https://www.youtube.com/watch?v=dQw4w9WgXcQ
https://youtu.be/dQw4w9WgXcQ
https://music.youtube.com/watch?v=dQw4w9WgXcQ
```

## Sorun Giderme

### Müzik Çalmıyor
- xsound yüklü mü kontrol et: `ensure xsound`
- Console'da hata var mı kontrol et
- YouTube URL'si geçerli mi kontrol et

### Menü Açılmıyor
- Araçta mısın?
- Sürücü koltuğunda mısın?
- K tuşu başka bir şeye atanmış mı?

### Ses Duyulmuyor
- Ses seviyesi 0 mı?
- xsound çalışıyor mu?
- Mesafe çok uzak mı? (30m limit)

## Gelecek Güncellemeler

- [ ] Spotify entegrasyonu
- [ ] Radyo istasyonları
- [ ] Favori şarkılar
- [ ] Database ile playlist kaydetme
- [ ] Equalizer (10 band)
- [ ] Ses efektleri (reverb, echo)

## Sonuç

✅ Araç hoparlör sistemi kuruldu  
✅ Bass ve tiz kontrolü eklendi  
✅ Modern UI tasarlandı  
✅ xsound entegrasyonu tamamlandı  
✅ Playlist sistemi eklendi

Artık araçlarda müzik çalabilir, bass/tiz ayarlayabilir ve herkes duyabilir!
