# 🎵 SWX Speaker - Araç Hoparlör Sistemi

![Version](https://img.shields.io/badge/version-1.2.0-blue)
![Author](https://img.shields.io/badge/author-SWX%20Scripts-purple)
![Framework](https://img.shields.io/badge/framework-QBCore-green)

## 📋 Özellikler

- ✅ YouTube müzik çalma (xsound entegrasyonu)
- ✅ Playlist sistemi (sıralama, ekleme, çıkarma)
- ✅ Kalıcı müzik geçmişi (database)
- ✅ 8 farklı audio filtre tipi (UI)
- ✅ Ses seviyesi ve mesafe kontrolü
- ✅ Duraklat/Devam ettir
- ✅ Araç içi pozisyonel ses
- ✅ ox_lib Context Menu UI
- ✅ Türkçe dil desteği

## 🎯 Gereksinimler

- QBCore Framework
- ox_lib
- xsound
- oxmysql

## 📥 Kurulum

### 1. Resource'u Yerleştir
```
data/resources/[standalone]/swx_speaker/
```

### 2. SQL Tablosunu Oluştur
```sql
-- speaker_history.sql dosyasını import et
-- Veya HeidiSQL/phpMyAdmin'de çalıştır
```

### 3. server.cfg'ye Ekle
```cfg
ensure swx_speaker
```

### 4. Restart
```
restart swx_speaker
```

## 🎮 Kullanım

### Menüyü Açma
- **Tuş**: K (varsayılan)
- **Konum**: Araç içinde, sürücü koltuğunda

### Temel İşlevler
1. **Müzik Çal**: YouTube URL'si gir
2. **Sıraya Ekle**: Playlist'e şarkı ekle
3. **Sonraki Şarkı**: Playlist'te ilerle
4. **Duraklat/Devam**: Müziği kontrol et
5. **Ses Ayarları**: Volume ve mesafe ayarla

### Gelişmiş Özellikler
- **Müzik Geçmişi**: Son 50 şarkı (kalıcı)
- **Filtreler**: 8 farklı audio filtre (UI only)
- **Playlist Yönetimi**: Sıralama, silme, temizleme

## 🎨 Menü Yapısı

```
Ana Menü (K tuşu)
├── Müzik çal
├── Müzik sıraya al
├── Sonraki şarkı
├── Müziği duraklat/devam ettir
├── Ses seviyesini/aralığını değiştir
└── Diğer
    ├── Sırayı yönet
    ├── Müzik geçmişi
    ├── Filtreler
    └── Diğer ayarlar
```

## 🔧 Yapılandırma

### config.lua
```lua
Config.OpenKey = 'K'              -- Menü açma tuşu
Config.DefaultVolume = 0.2        -- Varsayılan ses (0.10-1.5)
Config.MaxDistance = 45.0         -- Maksimum mesafe (1.0-75.0)
Config.MaxPlaylistSize = 50       -- Playlist limiti
Config.MaxHistorySize = 50        -- Geçmiş limiti
```

## 📊 Database

### Tablo: speaker_history
```sql
CREATE TABLE IF NOT EXISTS `speaker_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `url` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Bilinmeyen Şarkı',
  `played_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `played_at` (`played_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

## 🎧 Audio Filtreler

### Mevcut Filtreler
1. **Lowpass**: Boğuk, kapalı ses
2. **Highpass**: İnce, telefon sesi
3. **Bandpass**: Telsiz efekti
4. **Notch**: Cızırtı temizleme
5. **Peaking**: Bass/tiz boost
6. **Lowshelf**: Subwoofer efekti
7. **Highshelf**: Parlaklık artışı
8. **Allpass**: Faz değişimi

**Not**: Filtreler şu an sadece UI gösterimi için. Gerçek audio filter için custom xsound fork gerekir.

## 🐛 Sorun Giderme

### Müzik Çalmıyor
1. xsound çalışıyor mu? → `restart xsound`
2. YouTube URL'si doğru mu?
3. Araç içinde misin?
4. Sürücü koltuğunda mısın?

### Geçmiş Yüklenmiyor
1. SQL tablosu oluşturuldu mu?
2. oxmysql çalışıyor mu?
3. Database bağlantısı var mı?

### Menü Açılmıyor
1. ox_lib yüklü mü?
2. qb-core çalışıyor mu?
3. K tuşu başka bir script ile çakışıyor mu?

## 📝 Changelog

### v1.2.0 (2026-04-05)
- ✅ Kalıcı müzik geçmişi (database)
- ✅ Filtre sistemi iyileştirmeleri
- ✅ Ses bozulması düzeltmeleri
- ✅ UI iyileştirmeleri

### v1.1.0
- ✅ Duraklat/Devam ettir toggle
- ✅ Filtre yönetimi
- ✅ Aktif filtreler menüsü

### v1.0.0
- ✅ İlk sürüm
- ✅ Temel müzik çalma
- ✅ Playlist sistemi

## 🚀 Gelecek Özellikler

- [ ] Gerçek audio filter (custom xsound)
- [ ] Favori sistemi
- [ ] Playlist kaydetme
- [ ] Spotify entegrasyonu
- [ ] Discord bot entegrasyonu

## 📞 Destek

**Discord**: SWX Scripts  
**GitHub**: swx-scripts/swx_speaker

## 📜 Lisans

MIT License

---

**Made with ❤️ by SWX Scripts**  
**Signature**: `swx_` - Quality FiveM Scripts
