# Nexora Araç Hoparlör Sistemi

Modern ve kullanıcı dostu araç radyo/hoparlör sistemi.

## Özellikler

✅ **YouTube Entegrasyonu**: YouTube linklerini direkt çal  
✅ **Bass & Tiz Ayarı**: -10 ile +10 arası bass ve tiz kontrolü  
✅ **Ses Seviyesi**: 0-100% arası ses kontrolü  
✅ **Mesafe Bazlı Ses**: 30 metre mesafeden duyulur  
✅ **Playlist Geçmişi**: Son çalınan şarkıları göster  
✅ **Modern UI**: Glassmorphism tasarım  
✅ **Türkçe Dil Desteği**: Tam Türkçe arayüz

## Kullanım

### Menüyü Açma
Araçtayken **K** tuşuna bas (veya `/carradio` komutu)

### Müzik Çalma
1. YouTube URL'sini yapıştır
2. "Çal" butonuna tıkla
3. Müzik araç hoparlöründen çalmaya başlar

### Kontroller
- **▶ Çal**: Yeni şarkı çal
- **⏸ Duraklat**: Müziği duraklat
- **▶ Devam**: Duraklatılan müziği devam ettir
- **⏹ Durdur**: Müziği tamamen durdur

### Ses Ayarları
- **Ses Seviyesi**: Slider ile 0-100% arası ayarla
- **Bass**: -10 ile +10 arası bass kontrolü (düşük frekanslar)
- **Tiz**: -10 ile +10 arası tiz kontrolü (yüksek frekanslar)

### Playlist
- Son çalınan şarkılar otomatik kaydedilir
- Geçmiş şarkılara tıklayarak tekrar çalabilirsin
- "Temizle" butonu ile playlist'i sıfırla

## Teknik Detaylar

### Bağımlılıklar
- `qb-core`
- `xsound`

### Ses Mesafesi
- Araç içi: 30 metre
- Yaya: 10 metre

### Tuş Ayarları
Config.lua'dan değiştirilebilir:
```lua
Config.OpenKey = 311 -- K tuşu
```

## Notlar

- Sadece sürücü koltuğundayken kullanılabilir
- Araçtan inince müzik otomatik durur
- xsound ile senkronize çalışır (herkes duyar)
- YouTube API gerektirmez (xsound üzerinden çalışır)

## Destek

Sorun bildirmek için: discord.gg/Nexora
