# UM-Multicharacter Test Rehberi

## ✅ Yapılan İşlemler

1. ✅ um-multicharacter scripti `data/resources/[qb]/um-multicharacter/` konumuna kopyalandı
2. ✅ Config dili Türkçe yapıldı (`Config.Lang = 'tr'`)
3. ✅ server.cfg'de um-multicharacter aktif edildi
4. ✅ ak4y-multicharacter devre dışı bırakıldı (yorum satırı)

---

## 🎮 Test Adımları

### 1. Sunucuyu Başlat

```bash
# VPS'de veya local'de FiveM sunucusunu başlat
```

### 2. Console Kontrolü

Sunucu başlarken console'da şunları kontrol et:

```
✅ Started resource um-multicharacter
❌ SCRIPT ERROR hatası olmamalı
```

### 3. Oyuna Gir

1. FiveM'i aç
2. Sunucuna bağlan
3. Karakter seçim ekranı açılmalı

### 4. Karakter Seçim Ekranı Testleri

#### Test 1: Mevcut Karakterleri Gör
- [ ] Mevcut karakterlerin listesi görünüyor mu?
- [ ] Karakter isimleri, para, meslek bilgileri doğru mu?
- [ ] Karakter avatarları/modelleri görünüyor mu?

#### Test 2: Karakter Seç
- [ ] Bir karaktere tıkla
- [ ] Karakter detayları sol panelde görünüyor mu?
- [ ] "Play Character" butonu çalışıyor mu?
- [ ] Oyuna giriş yapabiliyor musun?

#### Test 3: Yeni Karakter Oluştur
- [ ] "Create New Character" slotuna tıkla
- [ ] Karakter oluşturma ekranı açılıyor mu?
- [ ] İsim, soyisim, doğum tarihi, cinsiyet seçebiliyor musun?
- [ ] Karakter görünümü düzenleyebiliyor musun?
- [ ] Yeni karakteri kaydedebiliyor musun?

#### Test 4: Karakter Sil
- [ ] Bir karakteri seç
- [ ] "Delete Character" butonuna tıkla
- [ ] Onay mesajı çıkıyor mu?
- [ ] Karakter siliniyor mu?

#### Test 5: Çoklu Karakter
- [ ] Birden fazla karakter oluşturabildin mi?
- [ ] Karakterler arası geçiş yapabiliyor musun?
- [ ] Her karakterin verileri ayrı mı? (para, envanter, vb.)

---

## 🎨 Görsel Kontroller

### Tasarım
- [ ] Arka plan bulanık mı? (blur effect)
- [ ] Karanlık, sinematik görünüm var mı?
- [ ] Animasyonlar smooth mu?
- [ ] Hover efektleri çalışıyor mu?

### UI Elemanları
- [ ] Sol panel: Ana karakter kartı
- [ ] Sağ panel: Karakter slotları
- [ ] Butonlar: Play, Delete, Create
- [ ] İstatistikler: Cash, Bank, Job, Phone vb.

---

## ⚙️ Config Ayarları

### Şu Anki Ayarlar

```lua
Config.Lang = 'tr' -- Türkçe dil
Config.PerformanceMode = false -- Efektler aktif
Config.CleanZone = false -- NPC temizleme kapalı
Config.HideRadar = false -- Radar gizleme kapalı
Config.QBLogs = false -- QB Logs kapalı

Config.Clothing = 'qb-clothing' -- Kıyafet sistemi
Config.SkinTable = 'playerskins' -- Skin tablosu
Config.AnimationMenu = 'other' -- Animasyon menüsü

Config.ApartmentStart = true -- Yeni karakter apartmanda başlar
Config.DefaultSlots = 5 -- Varsayılan karakter slotu
Config.DeleteButton = true -- Silme butonu aktif

Config.CinematicMode = false -- Sinematik mod kapalı
Config.BackgroundMusic.Status = false -- Arka plan müziği kapalı
```

### Önerilen Değişiklikler (İsteğe Bağlı)

#### Performans Modu (Düşük FPS için)
```lua
Config.PerformanceMode = true
```

#### Arka Plan Müziği
```lua
Config.BackgroundMusic = {
    Status = true,
    Name = 'bgmusic.mp3',
    Volume = 0.2
}
```

#### Sinematik Mod
```lua
Config.CinematicMode = true
```

#### Daha Fazla Slot
```lua
Config.DefaultSlots = 8
```

---

## 🐛 Sık Karşılaşılan Hatalar

### "SCRIPT ERROR: um-multicharacter"
**Sebep**: oxmysql veya ox_lib yüklü değil
**Çözüm**: 
```cfg
ensure ox_lib
ensure oxmysql
ensure um-multicharacter
```

### Karakter Seçim Ekranı Açılmıyor
**Sebep**: ak4y-multicharacter hala aktif
**Çözüm**: server.cfg'de `# ensure ak4y-multicharacter` yorum satırı yap

### Karakterler Görünmüyor
**Sebep**: Veritabanı bağlantısı yok
**Çözüm**: 
1. MySQL çalışıyor mu kontrol et
2. `mysql_connection_string` doğru mu kontrol et

### Kıyafetler Yüklenmiyor
**Sebep**: Clothing sistemi yanlış ayarlanmış
**Çözüm**: 
```lua
Config.Clothing = 'qb-clothing' -- veya 'fivem-appearance'
```

### Spawn Olmuyor
**Sebep**: Spawn event yanlış
**Çözüm**: 
```lua
Config.QBEvents = {
    spawnEventUI = 'apartments:client:setupSpawnUI', -- veya 'um-spawn:client:startSpawnUI'
}
```

---

## 📊 Performans Karşılaştırması

### ak4y-multicharacter
- Basit tasarım
- Hızlı yükleme
- Az özellik

### um-multicharacter
- Modern, sinematik tasarım
- Daha fazla özellik
- Özelleştirilebilir
- Blur efektleri
- Animasyonlar
- Müzik desteği

---

## 🔄 Geri Dönüş (Rollback)

Eğer um-multicharacter'i beğenmediysen, ak4y'ye geri dön:

### server.cfg'de değiştir:
```cfg
# ensure um-multicharacter
ensure ak4y-multicharacter
```

### Sunucuyu yeniden başlat

---

## 📝 Notlar

1. **İlk Kurulum**: İlk kez kullanıyorsan, mevcut karakterlerin um-multicharacter'de görünmesi gerekir
2. **Veritabanı**: Her iki script de aynı `players` tablosunu kullanır
3. **Kıyafetler**: fivem-appearance kullanıyorsan config'de belirt
4. **Spawn**: qb-apartments veya um-spawn kullanabilirsin

---

## 🎯 Başarı Kriterleri

Test başarılı sayılır eğer:

- [x] Sunucu hatasız başladı
- [x] Karakter seçim ekranı açıldı
- [x] Mevcut karakterler görünüyor
- [x] Yeni karakter oluşturulabiliyor
- [x] Karakterler arası geçiş yapılabiliyor
- [x] Oyuna giriş yapılabiliyor
- [x] Tasarım modern ve smooth

---

## 📞 Destek

Sorun yaşarsan:

1. Console'daki hata mesajlarını kontrol et
2. F8 → `resmon` komutuyla performansı kontrol et
3. Config ayarlarını gözden geçir
4. Veritabanı bağlantısını test et

---

**Kurulum Tarihi**: 2026-04-04
**Script Versiyonu**: um-multicharacter (latest)
**Framework**: QBCore
**Durum**: Test Edilmeye Hazır ✅
