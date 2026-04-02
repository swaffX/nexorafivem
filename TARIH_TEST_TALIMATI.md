# 🧪 Tarih Formatı Test Talimatı

## Hızlı Test

1. **Sunucuyu yeniden başlat:**
   ```
   restart wais-hudv6
   ```

2. **Oyuna gir**

3. **HUD'a bak** - Tarih şöyle görünmeli:
   ```
   2 Nisan Perşembe
   ```

## Detaylı Test

### 1. Console Kontrolü

F12 tuşuna bas ve Console sekmesine git.

Şu mesajları görmeli:
```
[wais-hudv6] Turkish date format override loaded
[Date Override] Found and updated date element: ...
```

### 2. Element Kontrolü

Console'da şu komutu çalıştır:
```javascript
document.querySelectorAll('[class*="date"]')
```

Tarih elementini görmeli.

### 3. Manuel Tarih Kontrolü

Console'da:
```javascript
const now = new Date();
console.log(`${now.getDate()} ${['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık'][now.getMonth()]} ${['Pazar','Pazartesi','Salı','Çarşamba','Perşembe','Cuma','Cumartesi'][now.getDay()]}`);
```

Çıktı HUD'daki tarih ile aynı olmalı.

## Beklenen Sonuçlar

✅ Tarih formatı: "2 Nisan Perşembe"
✅ Türkçe ay adı (Nisan)
✅ Türkçe gün adı (Perşembe)
✅ Gün numarası başta (2)
✅ Console'da hata yok

## Sorun Varsa

### Tarih "Nisan 2" Görünüyorsa

❌ date-override.js çalışmıyor

**Çözüm:**
1. Dosya yolunu kontrol et: `data/resources/[standalone]/wais-hudv6/web/dist/date-override.js`
2. index.html'de script tag'ini kontrol et
3. Console'da hata var mı bak

### Tarih Hiç Görünmüyorsa

❌ Element bulunamıyor

**Çözüm:**
1. F12 > Console
2. `document.querySelectorAll('[class*="date"]')` çalıştır
3. Dönen elementleri kontrol et
4. Class/ID isimlerini date-override.js'e ekle

### Console'da Hata Varsa

❌ JavaScript hatası

**Çözüm:**
1. Hatayı oku
2. date-override.js dosyasını kontrol et
3. Syntax hatası var mı bak

## Başarı Kriterleri

- [x] Tarih "2 Nisan Perşembe" formatında
- [x] Türkçe karakterler doğru (ş, ç, ı)
- [x] Her saniye güncelleniyor
- [x] Console'da hata yok
- [x] Performans sorunu yok

## Performans Testi

1. **Resmon aç:** `/resmon`
2. **wais-hudv6'yı bul**
3. **ms değerini kontrol et**

Beklenen: 0.00-0.01 ms (değişiklik yok)

## Son Kontrol

```bash
# Dosyaların varlığını kontrol et
ls data/resources/[standalone]/wais-hudv6/web/dist/date-override.js
ls data/resources/[standalone]/wais-hudv6/web/dist/index.html

# İçeriği kontrol et
cat data/resources/[standalone]/wais-hudv6/web/dist/index.html | grep "date-override"
```

Çıktı:
```html
<script src="date-override.js"></script>
```

## Tamamlandı! ✅

Eğer tüm testler başarılı ise, tarih formatı düzeltmesi tamamlanmıştır.

Artık HUD'da "2 Nisan Perşembe" formatında Türkçe tarih görünüyor! 🎉
