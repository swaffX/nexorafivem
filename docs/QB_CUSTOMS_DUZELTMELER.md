# QB-CUSTOMS DÜZELTMELERİ

## Yapılan Değişiklikler

### ✅ 1. Para Birimi Değişikliği (DKK → $)
**Dosya:** `client/cl_ui.lua`
- Tüm "DKK" ifadeleri "$" ile değiştirildi
- Fiyat gösterimleri: `"$" .. fiyat` formatına çevrildi
- Örnek: `"$400"`, `"$1000"`, `"$0"` (mekanikler için)

### ✅ 2. Türkçe Çeviri
**Dosya:** `client/cl_ui.lua` ve `client/cl_bennys.lua`

#### Menü Başlıkları:
- "Velkommen til Benny's" → "Benny's Original Motorworks'e Hoşgeldiniz"
- "Vælg En Kategori" → "Bir Kategori Seçin"
- "Respray" → "Boya"
- "Window Tint" → "Cam Filmi"
- "Neons" → "Neonlar"
- "Xenons" → "Xenon Farlar"
- "Wheels" → "Jantlar"
- "Old Livery" → "Eski Kaplama"
- "Plate Index" → "Plaka Rengi"
- "Vehicle Extras" → "Araç Ekstraları"

#### Durum Mesajları:
- "Installeret" → "Takılı"
- "Purchased" → "Satın Alındı"
- "Ikke nok penge" → "Yeterli Para Yok"
- "Køb Succesfuldt" → "Satın Alma Başarılı"
- "Du er ikke autoriseret" → "Yetkiniz Yok"

#### E Etkileşim Metni:
- "[Tryk ~p~E~w~ - Gå Ind I Benny's Motorworks]" → "[~p~E~w~ Tuşuna Bas - Benny's Motorworks'e Gir]"

### ✅ 3. Mekanikler İçin Ücretsiz Parça Takma
**Dosya:** `server/sv_bennys.lua`

```lua
-- Mekanikler için fiyat hesaplama
if type == "repair" then
    cost = isMechanic and 0 or repairCost
elseif type == "performance" then
    cost = isMechanic and 0 or vehicleCustomisationPrices[type].prices[upgradeLevel]
else
    cost = isMechanic and 0 or vehicleCustomisationPrices[type].price
end

-- Para kontrolü
if isMechanic then
    balance = 999999999 -- Mekanikler için sınırsız
else
    balance = Player.Functions.GetMoney(moneyType)
end
```

**Özellikler:**
- `job.name == "mechanic"` olan oyuncular tüm parçaları $0'a takabilir
- Onarım, performans yükseltmeleri, kozmetik modlar - hepsi ücretsiz
- Normal oyuncular hala ödeme yapar

### ✅ 4. Syntax Hataları Düzeltildi
**Dosya:** `client/cl_ui.lua`
- Satır 280'deki eksik string concatenation düzeltildi
- Tüm fiyat gösterimlerinde tutarlılık sağlandı

## Test Edilmesi Gerekenler

1. **Mekanik Testi:**
   - Mekanik mesleğine sahip bir oyuncu ile giriş yap
   - Benny's'e git
   - Herhangi bir parça takılmaya çalışıldığında $0 göstermeli
   - Parça takılabilmeli (para kesilmemeli)

2. **Normal Oyuncu Testi:**
   - Mekanik olmayan bir oyuncu ile giriş yap
   - Benny's'e git
   - Fiyatlar $ olarak gösterilmeli (örn: $400, $1000)
   - Para kesilmeli

3. **Türkçe Kontrol:**
   - Tüm menüler Türkçe olmalı
   - E tuşu etkileşimi Türkçe olmalı
   - Bildirimler Türkçe olmalı

4. **Menü Donma Testi:**
   - Parça takılırken menü donmamalı
   - Smooth çalışmalı

## Dosya Konumları

```
data/resources/[meslek]/[legal]/qb-customs/
├── client/
│   ├── cl_bennys.lua (✅ Düzeltildi)
│   └── cl_ui.lua (✅ Düzeltildi)
├── server/
│   └── sv_bennys.lua (✅ Düzeltildi)
├── config.lua (Değişiklik yok)
└── fxmanifest.lua (Değişiklik yok)
```

## Server.cfg

Script zaten yüklü:
```cfg
# Jobs / Meslekler
ensure [meslek]
```

qb-customs `[meslek]/[legal]/` klasöründe olduğu için otomatik yüklenir.

## Restart Komutu

```bash
restart qb-customs
```

veya

```bash
ensure qb-customs
```

## Sorun Giderme

### Menü Açılmıyor
- F8 konsolu kontrol et
- `restart qb-customs` yap
- `ensure qb-core` sonra `ensure qb-customs` yap

### Fiyatlar Hala DKK Gösteriyor
- Tarayıcı cache'ini temizle (F5 veya Ctrl+F5)
- Oyunu tamamen kapat ve tekrar aç

### Mekanikler Para Ödüyor
- Oyuncunun job'ının "mechanic" olduğundan emin ol
- `/job` komutu ile kontrol et
- Server loglarını kontrol et

## Notlar

- ✅ Tüm değişiklikler yapıldı
- ✅ Syntax hataları yok
- ✅ Mekanikler için $0 fiyat sistemi aktif
- ✅ Türkçe çeviri tamamlandı
- ✅ Para birimi $ olarak ayarlandı
- ⏳ Test edilmesi gerekiyor

---
**Tarih:** 2026-04-04
**Durum:** Tamamlandı ✅
