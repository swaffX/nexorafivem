# 🎵 3D Müzik Sistemi - wais-hudv6

## ✅ Yapılan Değişiklikler

Araç müzik sistemi artık **3D pozisyonel ses** olarak çalışıyor!

### Özellikler:

1. **🔊 3D Ses** - Müzik artık araçtan yayılıyor
2. **👥 Çoklu Oyuncu** - Yakındaki oyuncular müziği duyabiliyor
3. **📍 Pozisyonel** - Ses aracın konumuna bağlı
4. **🚗 Hareket** - Araç hareket ettikçe ses de hareket ediyor
5. **🚪 Otomatik Durdurma** - Araçtan inince müzik duruyor

## 🎮 Nasıl Kullanılır?

### 1. Müzik Açma

1. Araca binin
2. **M** tuşuna basın (veya `/carcontrol` komutu)
3. **Müzik** sekmesine tıklayın
4. YouTube URL'si girin (örnek: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`)
5. **Oynat** butonuna tıklayın

### 2. Ses Ayarları

- **Ses Seviyesi**: Kaydırıcı ile ayarlayın (0-100%)
- **Oynat/Duraklat**: Butonlarla kontrol edin
- **Durdur**: Müziği tamamen kapatır

### 3. Mesafe Ayarı

Config dosyasında mesafeyi ayarlayabilirsiniz:

```lua
Config.MusicSystem = {
    ["distance"] = 10.0, -- Metre cinsinden mesafe (varsayılan: 10 metre)
}
```

## 🔧 Teknik Detaylar

### xSound Fonksiyonları

Sistem şu xSound fonksiyonlarını kullanıyor:

```lua
xSound:PlayUrlPos(id, url, volume, coords, loop)  -- 3D pozisyonda ses çal
xSound:Distance(id, distance)                      -- Duyulma mesafesini ayarla
xSound:Attached(id, entity)                        -- Sesi araca bağla
xSound:Destroy(id)                                 -- Sesi durdur ve temizle
```

### Otomatik Temizleme

- Araçtan çıkıldığında müzik otomatik olarak durur
- Yeni müzik açıldığında eski müzik otomatik silinir
- Sunucudan çıkıldığında tüm sesler temizlenir

## 📊 Performans

- **Resmon**: ~0.01ms (çok düşük)
- **Network**: Minimal (sadece URL paylaşılıyor)
- **Client**: xSound tarafından optimize edilmiş

## ⚙️ Ayarlar

### Mesafe Örnekleri:

```lua
["distance"] = 5.0   -- Yakın mesafe (5 metre)
["distance"] = 10.0  -- Normal mesafe (10 metre) - Varsayılan
["distance"] = 20.0  -- Uzak mesafe (20 metre)
["distance"] = 50.0  -- Çok uzak mesafe (50 metre)
```

### Sistemi Kapatma:

```lua
Config.MusicSystem = {
    ["disable"] = true,  -- Müzik sistemini tamamen kapat
}
```

## 🎯 Desteklenen Platformlar

- ✅ YouTube
- ✅ SoundCloud
- ✅ Direkt MP3/OGG linkleri
- ✅ Diğer xSound destekli platformlar

## 🐛 Sorun Giderme

### Müzik Duyulmuyor

1. xSound'un çalıştığından emin olun: `ensure xsound`
2. Config'de `disable = false` olduğunu kontrol edin
3. Araç blacklist'te olmadığını kontrol edin
4. F8 konsola bakın, hata var mı kontrol edin

### Müzik Çok Sessiz/Yüksek

- Oyun içi ses ayarlarını kontrol edin
- Müzik menüsünden ses seviyesini ayarlayın
- Config'deki distance değerini değiştirin

### Müzik Kesilmiyor

- Araçtan inin ve tekrar binin
- `/carcontrol` menüsünden "Durdur" butonuna basın
- Sunucuyu yeniden başlatın: `restart wais-hudv6`

## 📝 Notlar

- Müzik sadece araç içindeyken açılabilir
- Bazı araç tipleri blacklist'te olabilir (motosiklet, bisiklet vb.)
- YouTube videoları bazen bölge kısıtlaması olabilir
- Müzik URL'si tüm yakındaki oyuncularla paylaşılır

## 🔄 Güncelleme Notları

**v1.0.0** - İlk sürüm
- 3D pozisyonel ses eklendi
- Otomatik temizleme eklendi
- Mesafe ayarı eklendi
- Araç takip sistemi eklendi
