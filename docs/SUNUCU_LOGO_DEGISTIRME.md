# Sunucu Logo Değiştirme Rehberi

## Sorun
FiveM sunucu logosu değiştirildiğinde eski logo görünmeye devam ediyor.

**Sebep**: FiveM client'ı sunucu logolarını cache'liyor. Aynı dosya adıyla değiştirirsen cache'den eski logoyu gösterir.

---

## ✅ Çözüm: Logo Dosya Adını Değiştir

### 1. Server.cfg Güncellendi
```properties
# ESKİ:
load_server_icon myLogo.png

# YENİ:
load_server_icon nexoraLogo.png
```

### 2. Logo Dosyası Kopyalandı
- `data/myLogo.png` → `data/nexoraLogo.png`
- Yeni dosya adı kullanılıyor

### 3. Sunucuyu Restart Et
```bash
# Sunucuyu tamamen kapat ve tekrar başlat
quit
# Veya VPS'de:
systemctl restart fivem
```

---

## Client Cache Temizleme (Opsiyonel)

Eğer hala eski logo görünüyorsa, oyuncular FiveM cache'ini temizlemeli:

### Windows:
1. FiveM'i kapat
2. `Win + R` tuşlarına bas
3. `%localappdata%\FiveM\FiveM Application Data\cache` yaz
4. `cache` klasörünü sil
5. FiveM'i tekrar aç

### Alternatif (Kolay):
1. FiveM'i aç
2. F8 konsolu aç
3. `quit` yaz
4. FiveM'i tekrar başlat
5. Sunucu listesini yenile (F5)

---

## Logo Gereksinimleri

### Dosya Formatı
- **Format**: PNG (önerilen) veya JPG
- **Boyut**: 96x96 piksel (önerilen)
- **Maksimum**: 1 MB

### Dosya Konumu
- `data/nexoraLogo.png` (server.cfg ile aynı klasör)

### Server.cfg Ayarı
```properties
load_server_icon nexoraLogo.png
```

---

## Logo Değiştirme Adımları (Gelecek İçin)

### Yöntem 1: Dosya Adını Değiştir (Önerilen)
```bash
# 1. Yeni logoyu farklı bir adla kaydet
cp yeniLogo.png data/nexoraLogo2.png

# 2. Server.cfg'yi güncelle
load_server_icon nexoraLogo2.png

# 3. Sunucuyu restart et
```

### Yöntem 2: Cache Temizle (Zahmetli)
```bash
# 1. Aynı dosya adını kullan
cp yeniLogo.png data/nexoraLogo.png

# 2. Sunucuyu restart et

# 3. TÜM oyuncular cache temizlemeli (zahmetli!)
```

---

## Test

### Sunucu Tarafı
1. Sunucuyu restart et
2. Server console'da hata var mı kontrol et
3. `load_server_icon nexoraLogo.png` satırında hata olmamalı

### Client Tarafı
1. FiveM'i aç
2. Sunucu listesini yenile (F5)
3. Nexora Roleplay sunucusunu bul
4. Logo değişti mi kontrol et

**NOT**: İlk seferde görünmeyebilir, 2-3 kere yenile (F5)

---

## Mevcut Durum

✅ `server.cfg` güncellendi: `nexoraLogo.png`
✅ Logo dosyası kopyalandı: `data/nexoraLogo.png`
⏳ Sunucu restart bekleniyor

**Sonraki Adım**: Sunucuyu restart et ve test et!

---

## Sorun Giderme

### Logo Hala Görünmüyor
1. Dosya adını kontrol et: `data/nexoraLogo.png` var mı?
2. Dosya boyutunu kontrol et: 1 MB'dan küçük mü?
3. Server console'da hata var mı?
4. Sunucu tamamen restart edildi mi?

### Eski Logo Hala Görünüyor
1. FiveM cache'ini temizle (yukarıdaki adımlar)
2. Sunucu listesini birkaç kere yenile (F5)
3. FiveM'i kapat ve tekrar aç
4. Farklı bir dosya adı dene (örn: `nexoraLogo3.png`)

### Logo Bozuk Görünüyor
1. PNG formatında mı?
2. 96x96 piksel mi?
3. Şeffaf arka plan var mı? (olmamalı, beyaz arka plan kullan)
4. Dosya bozuk mu? Başka bir PNG editörle aç/kaydet

---

## Öneriler

1. **Her zaman farklı dosya adı kullan**: `logo1.png`, `logo2.png`, `logo3.png`
2. **96x96 piksel kullan**: Daha büyük logolar otomatik küçültülür
3. **Beyaz arka plan kullan**: Şeffaf arka plan sorun çıkarabilir
4. **1 MB'dan küçük tut**: Büyük dosyalar yavaş yüklenir
5. **PNG formatı kullan**: JPG kalitesi düşük olabilir

---

## Özet

✅ Logo dosya adı değiştirildi: `myLogo.png` → `nexoraLogo.png`
✅ Server.cfg güncellendi
✅ Yeni logo dosyası oluşturuldu
⏳ Sunucu restart gerekiyor

**Restart Komutu**:
```bash
quit
```

Sunucu restart edildikten sonra yeni logo görünecek!
