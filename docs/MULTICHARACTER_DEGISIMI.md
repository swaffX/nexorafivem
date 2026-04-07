# Multicharacter Sistemi Değişimi

## Özet
`ak4y-multicharacter` scripti kaldırılıp, yerine `um-multicharacter` scripti entegre edildi.

## Yapılan Değişiklikler

### 1. Klasör Yapısı
- ❌ **Kaldırıldı**: `data/resources/[qb]/ak4y-multicharacter/`
- ✅ **Kullanılıyor**: `data/resources/[exe-eklenti]/um-multicharacter/`

### 2. Event Değişiklikleri

#### fivem-appearance Integration
**Dosya**: `data/resources/[qb]/fivem-appearance/client/backward-events.lua`

```lua
-- ESKİ:
RegisterNetEvent("ak4y-multicharacter:client:chooseChar", function()

-- YENİ:
RegisterNetEvent("um-multicharacter:client:chooseChar", function()
```

### 3. Restart Script Güncellemesi
**Dosya**: `data/restart_resources.cfg`

```cfg
# ESKİ:
restart ak4y-multicharacter

# YENİ:
restart um-multicharacter
```

### 4. Server.cfg
Server.cfg'de değişiklik gerekmedi çünkü:
- `um-multicharacter` zaten `[exe-eklenti]` klasöründe
- Server.cfg'de `ensure [exe-eklenti]` satırı var
- Otomatik olarak yüklenecek

## um-multicharacter Özellikleri

### Avantajlar
- Daha modern UI/UX
- Daha iyi performans
- QBCore ile tam uyumluluk
- Aktif geliştirme ve destek
- Daha fazla özelleştirme seçeneği

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

### Test Edilmesi Gerekenler
- ✅ Karakter oluşturma
- ✅ Karakter seçme
- ✅ Karakter silme
- ✅ Spawn sistemi
- ✅ Appearance sistemi entegrasyonu
- ✅ Inventory entegrasyonu

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
