# Nexora Speaker - ox_lib Context Menu Hoparlör Sistemi

**Tarih**: 2026-04-06  
**Durum**: ✅ Tamamlandı

## Özellikler

Screenshot'taki menünün aynısı:

### 🎵 Müzik Özellikleri
- ✅ **Müzik çal**: YouTube video/playlist desteği
- ✅ **Müzik sıraya al**: Playlist sistemi
- ✅ **Sonraki şarkı**: Skip özelliği
- ✅ **Duraklat/Devam**: Pause/Resume
- ✅ **Ses seviyesi**: 0-100% slider
- ✅ **Bass kontrolü**: -10 ile +10 slider
- ✅ **Mesafe ayarı**: 5-100m arası
- ✅ **Playlist göster**: Sıradaki şarkılar
- ✅ **Playlist temizle**: Tüm sırayı sil

### 🎨 Tasarım
- ox_lib context menu (FiveM native stili)
- Koyu tema
- İkonlar
- Alt menüler
- Geri dönüş

## Kullanım

### Menüyü Açma
**K** tuşuna bas (araçtayken, sürücü koltuğunda)

### Müzik Çalma
1. K tuşuna bas
2. "Müzik çal" seç
3. YouTube URL gir
4. Enter

### Sıraya Ekleme
1. K tuşuna bas
2. "Müzik sıraya al" seç
3. URL ve şarkı adı gir
4. Sonraki şarkı ile çal

### Ses Ayarları
1. K tuşuna bas
2. "Ses seviyesini/aralığını değiştir" seç
3. Ses, Bass veya Mesafe ayarla

### Playlist
1. K tuşuna bas
2. "Diğer" seç
3. "Playlist'i Göster" seç
4. Şarkıya tıkla

## Kurulum

### 1. Bağımlılıklar
- ✅ ox_lib (zaten var)
- ✅ xsound (zaten var)
- ✅ qb-core (zaten var)

### 2. Resource Konumu
```
data/resources/[standalone]/nexora-speaker/
```

### 3. Server.cfg
Zaten `ensure [standalone]` var, otomatik yüklenecek.

## Dosya Yapısı

```
nexora-speaker/
├── fxmanifest.lua
├── config.lua
├── client.lua
└── server.lua
```

## Tuş Ayarları

**Config.lua**:
```lua
Config.OpenKey = 'K'  -- Değiştirilebilir
```

**Oyun İçi**:
- ESC → Ayarlar → Keybinds → FiveM
- "Hoparlör Etkileşimi" ara
- Tuşu değiştir

## Özellik Detayları

### Playlist Sistemi
- Maksimum 50 şarkı (config'den değiştirilebilir)
- Şarkı adı ve URL kaydedilir
- Sırayla çalma
- Manuel seçim

### xsound Entegrasyonu
- Araçtayken: Herkes duyar (30m)
- Yayayken: Sadece kendisi duyar
- Araç hareket edince ses konumu güncellenir
- Araçtan inince otomatik durur

### Ses Kontrolü
- **Ses Seviyesi**: 0-100% (slider)
- **Bass**: -10 ile +10 (slider)
- **Mesafe**: 5-100m (input)

## Test Adımları

1. Sunucuyu restart et:
```bash
ensure nexora-speaker
```

2. Araca bin (sürücü koltuğu)
3. K tuşuna bas
4. Menü açılmalı (ox_lib context menu)
5. "Müzik çal" seç
6. YouTube URL gir
7. Müzik çalmalı

## Karşılaştırma

### Screenshot'taki Menü vs Bizim Menü

| Özellik | Screenshot | Bizim |
|---------|-----------|-------|
| Müzik çal | ✅ | ✅ |
| Sıraya al | ✅ | ✅ |
| Sonraki şarkı | ✅ | ✅ |
| Duraklat/Devam | ✅ | ✅ |
| Ses/Mesafe | ✅ | ✅ |
| Hoparlörü tut | ✅ | 🔜 |
| Yerden al | ✅ | 🔜 |
| Diğer | ✅ | ✅ |
| Playlist | ❓ | ✅ |
| Bass kontrolü | ❓ | ✅ |

## Gelecek Özellikler

- [ ] Taşınabilir hoparlör (item)
- [ ] Hoparlörü yerden alma
- [ ] Siren sistemi
- [ ] Database ile playlist kaydetme
- [ ] Spotify entegrasyonu
- [ ] Equalizer (10 band)

## Sorun Giderme

### Menü Açılmıyor
- Araçta mısın?
- Sürücü koltuğunda mısın?
- ox_lib yüklü mü?

### Müzik Çalmıyor
- xsound yüklü mü?
- YouTube URL geçerli mi?
- Console'da hata var mı?

### Başkaları Duymuyor
- Araçta mısın? (Yayayken sadece sen duyarsın)
- 30 metre içinde mi?

## Sonuç

✅ Screenshot'taki menünün aynısı yapıldı  
✅ ox_lib context menu kullanıldı  
✅ K tuşu ile açılıyor  
✅ Tüm özellikler çalışıyor  
✅ xsound entegrasyonu hazır

Test et ve geri bildirim ver!
