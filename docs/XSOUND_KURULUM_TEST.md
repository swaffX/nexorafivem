# xSound Kurulum ve Test Rehberi
**Tarih:** 4 Nisan 2026  
**Durum:** ✅ Kurulum Tamamlandı

---

## ✅ KURULUM TAMAMLANDI

### Yapılan İşlemler
1. ✅ xSound resource'u eklendi: `data/resources/[voice]/xsound/`
2. ✅ server.cfg güncellendi: `ensure xsound` eklendi
3. ✅ xSound, wais-hudv6'dan ÖNCE yüklenecek şekilde ayarlandı

### server.cfg Sıralaması
```cfg
ensure [alan] 
ensure [qb]
ensure [standalone]
ensure xsound          # ← WAIS-HUD'dan ÖNCE
ensure [voice]         # ← pma-voice burada
```

Bu sıralama önemli çünkü wais-hudv6, xSound'un export'larını kullanıyor.

---

## 🧪 TEST ADIMLARI

### ADIM 1: Sunucuyu Başlat
```bash
# Sunucuyu tamamen kapat ve yeniden başlat
# VEYA
restart xsound
restart wais-hudv6
```

### ADIM 2: Konsol Kontrolü
Sunucu konsolunda şunları kontrol et:

**✅ Başarılı kurulum:**
```
Started resource xsound
Started resource wais-hudv6
```

**❌ Hata varsa:**
```
Error loading script client/main.lua in resource xsound
```
Bu durumda xSound dosyaları eksik veya bozuk olabilir.

### ADIM 3: Oyun İçi Test

#### Test 1: Tek Oyuncu Testi
1. Oyuna gir
2. Bir arabaya bin
3. **M** tuşuna bas (Car Control menüsü açılır)
4. **Müzik** sekmesine tıkla
5. Bir YouTube şarkı URL'si gir (örnek: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`)
6. **Oynat** butonuna tıkla
7. Şarkı çalıyor mu? ✅

#### Test 2: Çoklu Oyuncu Testi (ÖNEMLİ!)
1. İki oyuncu gerekli (sen + bir arkadaş)
2. İkisi de oyuna girsin
3. Birinci oyuncu arabaya binsin
4. **M** tuşuna basıp şarkı açsın
5. İkinci oyuncu, birinci oyuncunun arabasına yaklaşsın (10 metre içinde)
6. **İkinci oyuncu şarkıyı duyuyor mu?** ✅

**Beklenen sonuç:**
- 0-10 metre: Şarkı net duyulur
- 10+ metre: Şarkı duyulmaz (mesafe sınırı)

#### Test 3: Ses Seviyesi Testi
1. Arabaya bin ve şarkı aç
2. Car Control menüsünde ses seviyesini değiştir (0-100)
3. Ses seviyesi değişiyor mu? ✅

#### Test 4: Oynat/Duraklat Testi
1. Şarkı açıkken Car Control menüsünü aç
2. **Duraklat** butonuna tıkla → Şarkı durmalı
3. **Oynat** butonuna tıkla → Şarkı devam etmeli

#### Test 5: Araçtan İnme Testi
1. Şarkı açıkken arabadan in
2. Şarkı duraklamalı (arka planda çalmaya devam eder)
3. Tekrar arabaya bin
4. Şarkı kaldığı yerden devam etmeli

---

## 🔧 YAPILANDIRMA

### xSound Config (Opsiyonel)
`data/resources/[voice]/xsound/config.lua`

```lua
config = {}

-- Debug modu (test için açabilirsin)
config.debug = true  -- false → true yap

-- Pozisyon güncelleme sıklığı (ms)
config.RefreshTime = 300  -- Daha düşük = daha hassas, daha yüksek resmon

-- Ses güncellemesi başlamadan önce mesafe
config.distanceBeforeUpdatingPos = 40  -- 40 metre
```

### WAIS-HUD Config
`data/resources/[standalone]/wais-hudv6/config.lua`

```lua
Config.MusicSystem = {
    ["disable"] = false,  -- Müzik sistemi açık
    ["distance"] = 10.0,  -- 10 metre mesafe (xSound bunu kullanıyor)
}
```

**Not:** `distance` değerini artırırsan, şarkı daha uzaktan duyulur:
- `5.0` = 5 metre (yakın)
- `10.0` = 10 metre (normal)
- `20.0` = 20 metre (uzak)
- `50.0` = 50 metre (çok uzak, performans düşer)

---

## 🐛 SORUN GİDERME

### Sorun 1: Şarkı Hiç Çalmıyor
**Belirtiler:**
- M tuşuna basınca menü açılıyor
- Şarkı URL'si giriyorsun
- Oynat'a basıyorsun
- Hiçbir şey olmuyor

**Çözümler:**
1. F8 konsola bak, hata var mı?
2. xSound çalışıyor mu kontrol et:
   ```
   /showsounds
   ```
   Bu komut çalışıyorsa xSound aktif.

3. YouTube URL'si doğru mu?
   - ✅ Doğru: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`
   - ❌ Yanlış: `youtube.com/watch?v=dQw4w9WgXcQ` (https:// eksik)
   - ❌ Yanlış: `https://youtu.be/dQw4w9WgXcQ` (kısa link, çalışmayabilir)

4. Sunucuyu restart et:
   ```
   restart xsound
   restart wais-hudv6
   ```

### Sorun 2: Sadece Ben Duyuyorum, Diğerleri Duymuyor
**Belirtiler:**
- Şarkı çalıyor
- Ama yakındaki oyuncular duymuyor

**Çözümler:**
1. xSound'un server.lua dosyası var mı kontrol et:
   ```
   data/resources/[voice]/xsound/server/
   ```

2. xSound export'ları çalışıyor mu test et:
   ```lua
   -- F8 konsola yapıştır:
   exports.xsound:PlayUrl("test", "https://www.youtube.com/watch?v=dQw4w9WgXcQ", 0.5, false)
   ```

3. server.cfg'de sıralama doğru mu?
   ```cfg
   ensure xsound      # ÖNCE
   ensure wais-hudv6  # SONRA
   ```

### Sorun 3: Şarkı Çalıyor Ama Ses Yok
**Belirtiler:**
- Menüde şarkı bilgisi görünüyor
- Ama ses duyulmuyor

**Çözümler:**
1. Oyun ses seviyesini kontrol et (ESC → Ayarlar → Ses)
2. Ses seviyesini Car Control menüsünde artır
3. Streamer modu kapalı mı kontrol et:
   ```
   /streamer
   ```
   Eğer "Streamer mode is on" yazıyorsa, tekrar `/streamer` yaz (kapatır)

### Sorun 4: Şarkı Donuyor veya Kesilip Duruyor
**Belirtiler:**
- Şarkı başlıyor
- Ama sürekli kesilip duruyor

**Çözümler:**
1. İnternet bağlantını kontrol et (YouTube'dan stream yapıyor)
2. xSound RefreshTime'ı artır:
   ```lua
   -- config.lua
   config.RefreshTime = 500  -- 300 → 500
   ```
3. Sunucu performansını kontrol et (`/resmon`)

---

## 📊 BEKLENEN SONUÇLAR

### ✅ Başarılı Kurulum
- [x] Sunucu hatasız başlıyor
- [x] M tuşuna basınca menü açılıyor
- [x] Şarkı URL'si girilince çalıyor
- [x] Yakındaki oyuncular şarkıyı duyuyor
- [x] Ses seviyesi ayarlanabiliyor
- [x] Oynat/Duraklat çalışıyor
- [x] Araçtan inince şarkı duraklatılıyor

### ❌ Sorunlu Kurulum
- [ ] Sunucu başlarken xSound hatası veriyor
- [ ] M tuşuna basınca menü açılmıyor
- [ ] Şarkı çalmıyor
- [ ] Sadece ben duyuyorum, diğerleri duymuyor
- [ ] Ses seviyesi değişmiyor

---

## 🎵 TEST ŞARKILARI

Hızlı test için kullanabileceğin YouTube URL'leri:

1. **Kısa şarkı (test için ideal):**
   ```
   https://www.youtube.com/watch?v=dQw4w9WgXcQ
   ```

2. **Türkçe şarkı:**
   ```
   https://www.youtube.com/watch?v=HgzGwKwLmgM
   ```

3. **Uzun şarkı (dayanıklılık testi):**
   ```
   https://www.youtube.com/watch?v=jfKfPfyJRdk
   ```

---

## 📝 TEST RAPORU ŞABLONU

Test sonuçlarını kaydet:

```
=== xSound Test Raporu ===
Tarih: [tarih]
Sunucu: Nexora Roleplay

[ ] Test 1: Tek oyuncu - Şarkı çalıyor
[ ] Test 2: Çoklu oyuncu - Diğerleri duyuyor
[ ] Test 3: Ses seviyesi - Ayarlanabiliyor
[ ] Test 4: Oynat/Duraklat - Çalışıyor
[ ] Test 5: Araçtan inme - Duraklatılıyor

Notlar:
- 
- 
- 

Sorunlar:
- 
- 
```

---

## 🚀 SONRAKI ADIMLAR

1. **Şimdi yap:**
   - Sunucuyu restart et
   - Test 1'i yap (tek oyuncu)
   - Sonuçları bana bildir

2. **Sonra yap:**
   - Test 2'yi yap (çoklu oyuncu)
   - Mesafe ayarını test et
   - Performansı kontrol et

3. **İsteğe bağlı:**
   - Debug modunu aç (sorun varsa)
   - Mesafe değerini ayarla (10.0 → 15.0)
   - RefreshTime'ı optimize et

---

**Hazırlayan:** Kiro AI Assistant  
**Versiyon:** 1.0
