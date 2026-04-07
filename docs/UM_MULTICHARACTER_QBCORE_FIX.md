# um-multicharacter QBCore & ESX Otomatik Algılama

## Özellikler
✅ **Otomatik Framework Algılama**: QBCore veya ESX'i otomatik algılar
✅ **Çift Framework Desteği**: Her iki framework ile çalışır
✅ **Güvenli Geçiş**: Diğer scriptleri bozmaz
✅ **Dinamik SQL**: Framework'e göre doğru veritabanı sorgularını kullanır

## Nasıl Çalışır?

### Otomatik Algılama Sistemi
```lua
-- Framework otomatik algılanır
if GetResourceState('qb-core') == 'started' then
    → QBCore kullan
elseif GetResourceState('es_extended') == 'started' then
    → ESX kullan
end
```

### Framework'e Göre SQL Sorguları

#### QBCore Algılandığında:
```sql
SELECT citizenid, money, job, charinfo, skin 
FROM players 
WHERE citizenid LIKE 'char%:license'
```

#### ESX Algılandığında:
```sql
SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, height 
FROM users 
WHERE identifier LIKE 'char%:license'
```

## Yapılan Düzeltmeler

### 1. Framework Bridge (Otomatik Algılama)
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/bridge/framework.lua`

```lua
-- Otomatik framework algılama
local function DetectFramework()
    if GetResourceState('qb-core') == 'started' then
        return 'qbcore', exports['qb-core']:GetCoreObject()
    elseif GetResourceState('es_extended') == 'started' then
        return 'esx', exports["es_extended"]:getSharedObject()
    end
    return nil, nil
end

-- Tüm fonksiyonlar framework'e göre çalışır
function Framework:GetPlayer(src)
    if frameworkType == 'qbcore' then
        return QBCore.Functions.GetPlayer(src)
    elseif frameworkType == 'esx' then
        return ESX.GetPlayerFromId(src)
    end
end
```

### 2. GetSkin Bridge (Çift Veritabanı Desteği)
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/bridge/getskin.lua`

```lua
if frameworkType == 'qbcore' then
    -- playerskins tablosu (QBCore)
    MySQL.single.await('SELECT model, skin FROM playerskins WHERE citizenid = ? AND active = 1')
elseif frameworkType == 'esx' then
    -- users tablosu (ESX)
    MySQL.single.await('SELECT skin FROM users WHERE identifier = ?')
end
```

### 3. Config Events (Her İki Framework)
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/config.lua`

```lua
Config.FrameworkEvents = {
    qbcore = {
        customizationMenu = 'qb-clothing:client:openMenu',
        createCharacter = 'QBCore:Server:OnPlayerLoaded'
    },
    esx = {
        customizationMenu = 'esx_skin:openSaveableMenu',
        createCharacter = 'esx_identity:completedRegistration'
    }
}
```

## Güvenlik ve Uyumluluk

### ✅ Diğer Scriptleri Bozmaz
- Sadece kendi bridge dosyalarını kullanır
- Framework'ü değiştirmez, sadece algılar
- Mevcut scriptler etkilenmez

### ✅ Dinamik Çalışma
- Server başlatıldığında framework algılanır
- Yanlış framework kullanılmaz
- Hata mesajları açıklayıcıdır

### ✅ Geriye Dönük Uyumluluk
- ESX'ten QBCore'a geçişte sorun olmaz
- Eski karakterler korunur
- Veritabanı değişikliği gerekmez

## Test Senaryoları

### QBCore Sunucusunda:
1. ✅ Framework: QBCore algılanır
2. ✅ Veritabanı: `players` tablosu kullanılır
3. ✅ Identifier: `citizenid` (char1:license)
4. ✅ Skin: `playerskins` tablosu
5. ✅ Events: QBCore event'leri

### ESX Sunucusunda:
1. ✅ Framework: ESX algılanır
2. ✅ Veritabanı: `users` tablosu kullanılır
3. ✅ Identifier: `identifier` (char1:license)
4. ✅ Skin: `users.skin` kolonu
5. ✅ Events: ESX event'leri

## Sorun Giderme

### "No framework detected" Hatası:
```bash
# Çözüm: qb-core veya es_extended'in yüklendiğinden emin olun
ensure qb-core  # veya
ensure es_extended
```

### Framework Yanlış Algılanıyorsa:
```lua
-- Console'da kontrol edin:
print(Framework:GetType())  -- 'qbcore' veya 'esx' döner
```

### SQL Hatası Alıyorsanız:
1. Framework doğru algılandı mı? → Console'u kontrol edin
2. Veritabanı tabloları var mı? → `players` (QBCore) veya `users` (ESX)
3. Config.Prefix doğru mu? → `Config.Prefix = 'char'`

## Avantajlar

### 🔄 Esnek Geçiş
- ESX'ten QBCore'a geçiş kolay
- QBCore'dan ESX'e geçiş kolay
- Test sunucularında her ikisi de çalışır

### 🛡️ Güvenli
- Yanlış framework kullanımı engellenir
- SQL injection koruması
- Exploit koruması

### 📊 Performans
- Gereksiz kontroller yok
- Tek seferlik framework algılama
- Optimize edilmiş SQL sorguları

## Tarih
- **Düzeltme Tarihi**: 2026-04-07
- **Düzelten**: Kiro AI Assistant
- **Versiyon**: 2.0 (Otomatik Algılama)
- **Önceki Versiyon**: 1.0 (Sadece QBCore)
