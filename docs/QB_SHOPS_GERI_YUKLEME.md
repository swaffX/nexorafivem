# qb-shops Geri Yükleme Raporu
**Tarih:** 4 Nisan 2026  
**Durum:** ✅ qb-shops Aktif, brinley-shop Kaldırıldı

---

## 📋 YAPILAN İŞLEMLER

### 1. qb-shops Geri Yüklendi
- ✅ qb-shops resource'u geri eklendi
- ✅ qb-inventory event'leri aktif edildi
- ✅ "No shop inventory found" mesajı kaldırıldı

### 2. brinley-shop Kaldırıldı
- ✅ brinley-shop-main klasörü silindi
- ✅ server.cfg'den kaldırıldı (varsa)

### 3. qb-inventory Düzeltmeleri
**Dosya:** `data/resources/[qb]/qb-inventory/server/main.lua`

Event'ler tekrar aktif edildi:
```lua
TriggerClientEvent('qb-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
```

### 4. Konsol Mesajı Temizliği
**Dosya:** `data/resources/[qb]/qb-shops/client/main.lua`

```lua
-- Öncesi:
print('No shop inventory found -- defaults enabled')

-- Sonrası:
-- Shop inventory not found, using defaults (this is normal when Config.UseTruckerJob = false)
```

Artık konsola gereksiz mesaj yazmıyor.

---

## ✅ qb-shops ÖZELLİKLERİ

### Avantajları
1. **QBCore Standart:** QBCore'un resmi shop sistemi
2. **Trucker Job Entegrasyonu:** Stok sistemi (opsiyonel)
3. **Polyzone Sistemi:** Geniş alanlarda etkileşim
4. **Blip Sistemi:** Haritada otomatik işaretler
5. **NPC Sistemi:** Otomatik ped spawn

### Özellikler
- ✅ Otomatik blip oluşturma
- ✅ Otomatik NPC spawn
- ✅ qb-target veya drawtext desteği
- ✅ Stok sistemi (Config.UseTruckerJob = true ise)
- ✅ Job bazlı shop'lar
- ✅ Gang bazlı shop'lar
- ✅ Lisans kontrolü

---

## 📍 SHOP LOKASYONLARI

qb-shops config'inde tanımlı tüm shop'lar otomatik olarak çalışır.

### Varsayılan Shop'lar
- **24/7 Stores:** Genel market
- **Liquor Stores:** İçki dükkanı
- **Hardware Stores:** Hırdavat
- **Ammunation:** Silah dükkanı
- **Sea Word:** Dalış ekipmanları
- **Police Armory:** Polis deposu (job)
- **Prison Shop:** Hapishane dükkanı

---

## 🎮 KULLANIM

### Shop'a Gitme
1. Haritada mavi shop blip'ini bul
2. Shop'a git
3. Polyzone içine gir
4. DrawText görünür: "Open Shop"
5. E tuşuna bas veya qb-target kullan

### Alışveriş
1. Shop menüsü açılır
2. Ürün seç
3. Miktar belirle
4. Satın al

### Ödeme
- Önce nakit para kontrol edilir
- Nakit yoksa banka hesabından çekilir
- İkisi de yoksa hata verir

---

## 🔧 YAPILANDIRMA

### Config Dosyası
`data/resources/[qb]/qb-shops/config.lua`

### Önemli Ayarlar

**Stok Sistemi:**
```lua
Config.UseTruckerJob = false -- false = sınırsız stok, true = trucker job ile stok
```

**Target Sistemi:**
```lua
Config.UseTarget = true -- qb-target kullan
```

**Shop Inventory JSON:**
```lua
Config.ShopsInvJsonFile = './json/shops-inventory.json'
```

### Yeni Shop Ekleme
```lua
-- config.lua içinde Config.Locations
['yeni_shop'] = {
    ['products'] = {
        [1] = {name = 'water_bottle', price = 10, amount = 50, info = {}, type = 'item', slot = 1},
    },
    ['label'] = 'Yeni Shop',
    ['type'] = 'normal', -- veya 'job', 'gang'
    ['coords'] = vector4(x, y, z, heading),
    ['ped'] = 'mp_m_shopkeep_01',
    ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
    ['radius'] = 1.5,
    ['targetIcon'] = 'fas fa-shopping-basket',
    ['targetLabel'] = 'Yeni Shop',
    ['showblip'] = true,
    ['blipsprite'] = 52,
    ['blipscale'] = 0.6,
    ['blipcolor'] = 0
}
```

### Job Bazlı Shop
```lua
['police_armory'] = {
    -- ...
    ['type'] = 'job',
    ['job'] = 'police', -- sadece police job'ı girebilir
    -- ...
}
```

### Gang Bazlı Shop
```lua
['gang_shop'] = {
    -- ...
    ['type'] = 'gang',
    ['gang'] = 'ballas', -- sadece ballas gang'i girebilir
    -- ...
}
```

---

## 🐛 SORUN GİDERME

### Shop Açılmıyor
1. Polyzone içinde misin kontrol et
2. qb-target kurulu mu kontrol et
3. F8 konsola bak, hata var mı

### NPC Görünmüyor
```bash
restart qb-shops
```

### Blip Görünmüyor
Config'de `showblip = true` olduğundan emin ol:
```lua
['showblip'] = true,
```

### Ürün Alınamıyor
1. Envanterde yer var mı
2. Para yeterli mi
3. Job gerekliyse doğru job'da mısın
4. Stok var mı (Config.UseTruckerJob = true ise)

---

## 📊 PERFORMANS

### qb-shops Resmon
- **İdeal:** 0.00-0.02ms
- **Normal:** 0.02-0.05ms
- **Yüksek:** 0.05ms+

### Optimizasyon İpuçları
1. Gereksiz shop'ları kaldır
2. Polyzone boyutlarını küçült
3. NPC sayısını azalt
4. Blip sayısını azalt

---

## ✅ RESTART

Değişikliklerin aktif olması için:

```bash
restart qb-inventory
restart qb-shops
```

---

## 📝 NOTLAR

### Config.UseTruckerJob Hakkında
- **false:** Shop'lar sınırsız stokla çalışır (önerilen)
- **true:** Trucker job ile stok doldurulur (karmaşık)

Çoğu sunucu `false` kullanır çünkü daha basit ve kullanıcı dostu.

### shops-inventory.json Hakkında
Bu dosya sadece `Config.UseTruckerJob = true` ise kullanılır. 

Eğer `false` ise dosya boş olabilir:
```json
{
}
```

Bu normal ve sorun değil.

---

## 🔄 KARŞILAŞTIRMA

| Özellik | qb-shops | brinley-shop |
|---------|----------|--------------|
| UI | Basit | Modern Vue.js |
| Kurulum | Kolay | Orta |
| QBCore Entegrasyonu | Mükemmel | İyi |
| Stok Sistemi | Var | Yok |
| Polyzone | Var | Yok |
| Target | Var | Var |
| Blip | Otomatik | Manuel |
| NPC | Otomatik | Manuel |
| Performans | İyi | Çok İyi |

---

## ✅ SONUÇ

qb-shops başarıyla geri yüklendi ve aktif edildi.

**Yapılanlar:**
- ✅ qb-inventory event'leri aktif
- ✅ Konsol mesajı temizlendi
- ✅ brinley-shop kaldırıldı

**Test için:**
```bash
restart qb-inventory
restart qb-shops
```

Sonra bir shop'a git ve alışveriş yap!

---

**Hazırlayan:** Kiro AI Assistant  
**Versiyon:** 1.0
