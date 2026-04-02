# HB Motel Scripti

Bu script FiveM sunucuları için geliştirilmiş bir motel sistemidir. Oyuncular motel odası kiralayabilir, anahtar kullanabilir ve depo/gardrop sistemlerini kullanabilir.

## Özellikler

- ✅ Çoklu motel desteği
- ✅ Oda kiralama sistemi
- ✅ Anahtar sistemi
- ✅ Depo sistemi
- ✅ Gardrop sistemi
- ✅ Kira ücreti sistemi
- ✅ QBCore entegrasyonu
- ✅ qb-target entegrasyonu
- ✅ qb-menu entegrasyonu

## Kurulum

1. Scripti `resources` klasörüne kopyalayın
2. `server.cfg` dosyasına `ensure hb_motel` ekleyin
3. Veritabanı tablosunu oluşturun (hb_motel.sql)
4. Config dosyasını düzenleyin

## Yeni Motel Ekleme

Config.lua dosyasına yeni motel eklemek için aşağıdaki formatı kullanın:

```lua
Config.Motels = {
    ["motel_adi"] = {
        label = "Motel Görünen Adı",
        coords = vector3(x, y, z), -- Resepsiyon koordinatları
        pedModel = "a_m_y_stwhi_01", -- Resepsiyonist ped modeli
        rentPrice = 200, -- Kiralama ücreti
        rentFee = 20, -- Kira ücreti (2 saatte bir)
        rooms = {
            [1] = {
                door = vector3(x, y, z), -- Kapı koordinatları
                h = 0.0, -- Kapı yönü (heading)
                doortext = vector3(x, y, z), -- Kapı üzerindeki marker koordinatları
                stash = vector3(x, y, z), -- Depo koordinatları
                clothe = vector3(x, y, z), -- Gardrop koordinatları
                locked = true -- Başlangıçta kilitli mi?
            },
            -- Daha fazla oda ekleyebilirsiniz...
        }
    },
}
```

### Örnek Motel Konfigürasyonu

```lua
["sandyshores"] = {
    label = "Sandy Shores Motel",
    coords = vector3(1147.9, 2664.1, 38.1),
    pedModel = "a_m_y_stwhi_01",
    rentPrice = 150,
    rentFee = 15,
    rooms = {
        [1] = {
            door = vector3(1145.2, 2661.5, 38.1),
            h = 180.0,
            doortext = vector3(1145.2, 2661.5, 38.1),
            stash = vector3(1143.5, 2661.5, 38.1),
            clothe = vector3(1141.5, 2661.5, 38.1),
            locked = true
        },
        -- Daha fazla oda...
    }
}
```

## Komutlar

- `/motelcik` - En yakın motelden çıkış yapar
- `/yenimotelodasi` - Rastgele bir motel odası verir (test için)
- `/mk moteladi odano` - Belirtilen motel ve oda için anahtar verir (admin)

## Sistem Gereksinimleri

- QBCore Framework
- qb-target
- qb-menu
- oxmysql veya mysql-async
- qb-inventory, ps-inventory veya ox_inventory

## Veritabanı

Script otomatik olarak `motel_rentals` tablosunu oluşturur. Bu tablo şu sütunları içerir:
- `citizenid` - Oyuncu ID'si
- `motel` - Motel adı
- `room` - Oda numarası
- `rent_timestamp` - Kiralama zamanı

## Özellik Detayları

### Oda Kiralama
- Oyuncular resepsiyona yaklaşıp etkileşime geçebilir
- Boş odalar listelenir
- Kiralama ücreti nakit olarak alınır
- Anahtar otomatik olarak verilir

### Anahtar Sistemi
- Anahtarlar meta bilgisi ile saklanır
- Sadece kiralık odaların anahtarları çalışır
- Yedek anahtar satın alınabilir

### Depo Sistemi
- Her odanın kendine özel deposu vardır
- Depo adı: `hb_moteladi_odano` formatında
- 250kg kapasite, 50 slot

### Gardrop Sistemi
- Her odada kıyafet değiştirme noktası
- qb-clothing ile entegre

### Kira Sistemi
- 2 saatte bir otomatik kira kesintisi
- Banka hesabından kesilir
- Telefon faturası olarak gönderilir

## Sorun Giderme

### Motel Görünmüyor
- Config dosyasında koordinatları kontrol edin
- Ped modelinin doğru olduğundan emin olun

### Anahtar Çalışmıyor
- Anahtar meta bilgisini kontrol edin
- Motel adının doğru olduğundan emin olun

### Depo Açılmıyor
- Inventory sisteminin çalıştığından emin olun
- Stash adının doğru formatında olduğunu kontrol edin

## Destek

Herhangi bir sorun yaşarsanız, lütfen GitHub üzerinden issue açın veya Discord'dan iletişime geçin.

## Lisans

Bu script MIT lisansı altında lisanslanmıştır.

# MOTEL SCRIPT FOR QB

| If you are intested in recieving github updates join the community on **[Discord](https://discord.gg/tebex)**! |



**[PREVIEW](https://www.youtube.com/watch?v=FfwiUb45Hp0)**


**[Inspiration](https://github.com/morpheause/m3_motel)**


# Dependencies

**[qb-core](https://github.com/qbcore-framework/qb-core)**

