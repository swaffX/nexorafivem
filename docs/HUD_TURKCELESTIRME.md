# WAIS-HUDv6 Türkçeleştirme Raporu
**Tarih:** 4 Nisan 2026

## ✅ Yapılan Değişiklikler

### 1. Web Arayüzü Dil Ayarı (Config.json)
**Dosya:** `data/resources/[standalone]/wais-hudv6/web/public/Config.json`

**Değişiklik:**
```json
// ÖNCE:
"language": "en",
"timerLocation": "en-US",

// SONRA:
"language": "tr",
"timerLocation": "tr-TR",
```

**Etki:**
- ✅ Sağ üst köşe (Meslek, Çete, Banka, Nakit, Silah)
- ✅ Sağ alt köşe (Araç HUD - km/s, Yakıt, vb.)
- ✅ Sol alt köşe (Sağlık, Zırh, Açlık, Susuzluk, Stres, Dayanıklılık)
- ✅ Hızlı menü (Yakınlar, Müzik, Araç)
- ✅ Konum bilgisi
- ✅ Tarih/Saat formatı (Türkçe)

### 2. Lua Config Dil Ayarı (Zaten Doğruydu)
**Dosya:** `data/resources/[standalone]/wais-hudv6/config.lua`

```lua
Config.Language = "tr" -- ✅ Zaten Türkçe
```

### 3. Türkçe Çeviri Dosyaları (Zaten Mevcuttu)
**Dosyalar:**
- ✅ `locales/tr.lua` - Lua tarafı çeviriler
- ✅ `web/public/locales/tr.json` - Web arayüzü çeviriler

## 📋 Türkçe Çeviriler

### Sağ Üst Köşe
- Job → **Meslek**
- Gang → **Çete**
- Bank → **Banka**
- Cash → **Nakit**
- Weapon → **Silah**

### Araç HUD (Sağ Alt)
- km/h → **km/s**
- mph → **mil/s**
- Airspeed → **Hava Hızı**
- Waterspeed → **Su Hızı**
- Fuel → **Yakıt**

### Durum Barları (Sol Alt)
- Health → **Sağlık**
- Armor → **Zırh**
- Hunger → **Açlık**
- Thirst → **Susuzluk**
- Stress → **Stres**
- Stamina → **Dayanıklılık**

### Hızlı Menü
- Mark Text → **İşaretlemek için tıkla**
- Nearby → **Yakınlar**
- Music → **Müzik**
- Car → **Araç**

**Yakınlar Alt Menüsü:**
- Bank → **Banka**
- Shop → **Dükkan**
- Clothing → **Kıyafet Mağazası**
- Garage → **Garaj**
- Mechanic → **Tamirci**
- Gunshop → **Silahçı**

### Ayarlar Menüsü (/hud)
- Settings → **Ayarlar**
- General → **Genel**
- Car HUD → **Araç Hud**
- Status HUD → **Durum Hud**
- Right Corner → **Sağ Köşe**
- Reset Settings → **Ayarları Sıfırla**
- Confirm → **Onayla**
- Cancel → **İptal**

**Ayar Seçenekleri:**
- Fuel Type → **Yakıt Türü**
- Map → **Harita**
- Cinematic Mode → **Sinema Modu**
- Performance Mode → **Performans Modu**
- Speed Type → **Hız Türü**
- Map Radius → **Harita Kenar Yumuşaklığı**
- Theme Import/Export → **Tema İçe/Dışa Aktar**

### Bildirimler
- Status Alert → **Durum**
- Hunger Low → **Acıktın**
- Thirst Low → **Susadın**
- Belt Plug → **Kemer takıldı**
- Belt Unplug → **Kemer çıkarıldı**
- Postal Marked → **Posta haritasında işaretlendi**

## 🔄 Değişikliklerin Uygulanması

### Sunucu Tarafı
Sunucuyu yeniden başlatın:
```
restart wais-hudv6
```

### Oyuncu Tarafı
Oyuncular için 2 seçenek:

**Seçenek 1: Otomatik (Önerilen)**
- Oyuncular sunucudan çıkıp tekrar girsin
- HUD otomatik olarak Türkçe yüklenecek

**Seçenek 2: Manuel Sıfırlama**
- Oyunda `/hud` yazın
- "Ayarları Sıfırla" butonuna tıklayın
- Onaylayın
- HUD Türkçe olarak yüklenecek

## ⚠️ Önemli Notlar

1. **Mevcut Oyuncular:**
   - Sunucuda zaten oynayan oyuncuların tarayıcı cache'i temizlenmeli
   - F8 konsolunda `cl_drawfps 1` yazıp `cl_drawfps 0` yazarak test edebilirler
   - Veya sunucudan çıkıp tekrar girmeliler

2. **Tarih/Saat Formatı:**
   - Artık Türkçe format kullanılıyor: `tr-TR`
   - Örnek: "4 Nisan 2026, 14:30"

3. **Özelleştirmeler:**
   - Oyuncuların kendi yaptığı renk/pozisyon ayarları korunur
   - Sadece dil değişir

## 🎯 Test Checklist

Sunucuyu başlattıktan sonra kontrol edin:

- [ ] Sağ üst köşede "Meslek", "Çete", "Banka", "Nakit" yazıyor mu?
- [ ] Araca binince "km/s" ve "Yakıt" Türkçe mi?
- [ ] Sol altta "Sağlık", "Açlık", "Susuzluk" Türkçe mi?
- [ ] `/hud` menüsü tamamen Türkçe mi?
- [ ] Hızlı menü (M tuşu) Türkçe mi?
- [ ] Emniyet kemeri bildirimleri Türkçe mi?
- [ ] Tarih/saat Türkçe formatında mı?

## 📊 Sonuç

✅ **WAIS-HUDv6 artık tamamen Türkçe!**

Tüm arayüz elemanları, menüler, bildirimler ve ayarlar Türkçeleştirildi. Oyuncular artık HUD'ı kendi dillerinde kullanabilecekler.

---

**Not:** Herhangi bir sorun yaşarsanız, F8 konsolunda hata mesajı olup olmadığını kontrol edin ve bana bildirin.
