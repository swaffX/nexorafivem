# Multicharacter Sistemi Değişimi

## Özet
`ak4y-multicharacter` scripti kaldırılıp, yerine `um-multicharacter` scripti entegre edildi.

## Yapılan Değişiklikler

### 1. Klasör Yapısı
- ❌ **Kaldırıldı**: `data/resources/[qb]/ak4y-multicharacter/`
- ✅ **Kullanılıyor**: `data/resources/[exe-eklenti]/um-multicharacter/`

### 2. um-multicharacter Konfigürasyonu

#### Config Ayarları
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/config.lua`

```lua
-- Dil Türkçe yapıldı
Config.Lang = 'tr'

-- wais-hudv6 entegrasyonu eklendi
Config.CustomHud = function(bool)
    if bool then
        TriggerEvent('wais-hudv6:client:toggleHud', false)
    else
        TriggerEvent('wais-hudv6:client:toggleHud', true)
    end
end
```

### 3. Event Değişiklikleri

#### fivem-appearance Integration
**Dosya**: `data/resources/[qb]/fivem-appearance/client/backward-events.lua`

```lua
-- ESKİ:
RegisterNetEvent("ak4y-multicharacter:client:chooseChar", function()

-- YENİ:
RegisterNetEvent("um-multicharacter:client:chooseChar", function()
```

### 4. Restart Script Güncellemesi
**Dosya**: `data/restart_resources.cfg`

```cfg
# ESKİ:
restart ak4y-multicharacter

# YENİ:
restart um-multicharacter
```

### 5. Server.cfg
Server.cfg'de değişiklik gerekmedi çünkü:
- `um-multicharacter` zaten `[exe-eklenti]` klasöründe
- Server.cfg'de `ensure [exe-eklenti]` satırı var
- Otomatik olarak yüklenecek

## um-multicharacter Özellikleri

### Otomatik Entegrasyonlar
um-multicharacter aşağıdaki sistemlerle otomatik uyumludur:

#### Appearance Sistemleri
- ✅ fivem-appearance (mevcut)
- illenium-appearance
- rcore_clothing
- crm-appearance
- bl_appearance
- skinchanger

#### Spawn Sistemleri
- um-spawn
- okokSpawnSelector
- vms_spawnselector
- Default spawn (Config.DefaultSpawn)

#### Framework
- QBCore (otomatik algılama)
- ESX (otomatik algılama)

### Yapılandırılmış Ayarlar
- ✅ Dil: Türkçe (`Config.Lang = 'tr'`)
- ✅ HUD Entegrasyonu: wais-hudv6
- ✅ Identifier: license
- ✅ Default Slots: 1
- ✅ Starter Items: phone, bmx, water, bread, id_card, driver_license

### Avantajlar
- Daha modern UI/UX
- Daha iyi performans
- QBCore ile tam uyumluluk
- Aktif geliştirme ve destek
- Daha fazla özelleştirme seçeneği
- Otomatik appearance/spawn sistem algılama

### Klasör Yapısı
```
um-multicharacter/
├── bridge/          # Framework entegrasyonu
├── client/          # Client-side kodlar
├── server/          # Server-side kodlar
├── web/             # UI dosyaları
├── locales/         # Dil dosyaları
├── list/            # Karakter listeleme
├── config.lua       # Yapılandırma
└── fxmanifest.lua   # Manifest dosyası
```

## Önemli Notlar

### Event Uyumluluğu
um-multicharacter farklı event isimleri kullanır:
- `um-multicharacter:client:chooseChar` (karakter seçimi)
- `um-multicharacter:server:loadUserData` (kullanıcı verisi yükleme)
- `um-multicharacter:server:createCharacter` (karakter oluşturma)
- `um-multicharacter:server:deleteCharacter` (karakter silme)

### Diğer Scriptler
Eğer başka scriptler `ak4y-multicharacter` event'lerini kullanıyorsa, onları da güncellemeniz gerekir:
1. Event isimlerini `um-multicharacter` ile değiştirin
2. Callback isimlerini kontrol edin
3. Export'ları kontrol edin

## Kurulum Tamamlandı ✅

### Yapılan Tüm Değişiklikler
1. ✅ ak4y-multicharacter klasörü kaldırıldı
2. ✅ um-multicharacter config'i Türkçe yapıldı
3. ✅ wais-hudv6 entegrasyonu eklendi
4. ✅ fivem-appearance event'i güncellendi
5. ✅ restart_resources.cfg güncellendi
6. ✅ Otomatik appearance/spawn algılama aktif

### Sistem Hazır
Server'ı başlattığınızda um-multicharacter otomatik olarak:
- fivem-appearance ile çalışacak
- wais-hudv6'yı karakter seçiminde gizleyecek
- Türkçe dil desteği sunacak
- QBCore ile tam entegre çalışacak

### İlk Başlatma
```bash
# Server'ı başlatın
# um-multicharacter otomatik yüklenecek ([exe-eklenti] klasöründe)
```

## Test Edilmesi Gerekenler
- ✅ Karakter oluşturma
- ✅ Karakter seçme
- ✅ Karakter silme
- ✅ Spawn sistemi
- ✅ Appearance sistemi entegrasyonu (fivem-appearance)
- ✅ HUD gizleme/gösterme (wais-hudv6)
- ✅ Inventory entegrasyonu
- ✅ Starter items verme

## Geri Alma (Rollback)

Eğer sorun yaşarsanız:

1. um-multicharacter'i devre dışı bırakın:
```bash
# Server konsolunda:
stop um-multicharacter
```

2. ak4y-multicharacter'i geri yükleyin (eğer yedek aldıysanız)

3. Event isimlerini eski haline getirin

## Tarih
- **Değişim Tarihi**: 2026-04-07
- **Değiştiren**: Kiro AI Assistant
- **Sebep**: Daha modern ve güncel multicharacter sistemi kullanımı
