# um-multicharacter QBCore Uyumluluk Düzeltmeleri

## Sorunlar
1. ❌ `No such export getSharedObject in resource es_extended` - ESX arıyordu
2. ❌ `callback 'um-multicharacter:server:GetCharacters' does not exist` - Framework bridge hatalıydı

## Yapılan Düzeltmeler

### 1. Framework Bridge (QBCore Entegrasyonu)
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/bridge/framework.lua`

#### Değişiklikler:
```lua
-- ESKİ (ESX):
ESX = exports["es_extended"]:getSharedObject()

-- YENİ (QBCore):
QBCore = exports['qb-core']:GetCoreObject()
```

#### SQL Sorguları:
```lua
-- ESKİ (ESX users tablosu):
MySQL.query.await('SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, height FROM users WHERE identifier LIKE ?', { id })

-- YENİ (QBCore players tablosu):
MySQL.query.await('SELECT citizenid, money, job, charinfo, skin FROM players WHERE citizenid LIKE ?', { id })
```

#### Player Functions:
```lua
-- GetPlayer
ESX.GetPlayerFromId(src) → QBCore.Functions.GetPlayer(src)

-- GetPlayerFromIdentifier
ESX.GetPlayerFromIdentifier(char) → QBCore.Functions.GetPlayerByCitizenId(char)

-- PlayerDeadCheck
ESX.GetPlayerData()?.dead → QBCore.Functions.GetPlayerData().metadata?.isdead
```

### 2. GetSkin Bridge (Appearance Sistemi)
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/bridge/getskin.lua`

```lua
-- ESKİ (ESX):
MySQL.single.await('SELECT skin FROM users WHERE identifier = ? LIMIT 1', { identifier })

-- YENİ (QBCore):
MySQL.single.await('SELECT model, skin FROM playerskins WHERE citizenid = ? AND active = 1 LIMIT 1', { identifier })
```

### 3. Config Events
**Dosya**: `data/resources/[exe-eklenti]/um-multicharacter/config.lua`

```lua
-- ESKİ:
Config.ESXEvents = {
    customizationMenu = 'esx_skin:openSaveableMenu',
    createCharacter = 'esx_identity:completedRegistration'
}

-- YENİ:
Config.QBCoreEvents = {
    customizationMenu = 'qb-clothing:client:openMenu',
    createCharacter = 'QBCore:Server:OnPlayerLoaded'
}
```

## QBCore Veritabanı Yapısı

### players Tablosu
```sql
citizenid VARCHAR(50) PRIMARY KEY  -- char1:license
money TEXT                          -- JSON: {bank: 0, cash: 0}
job TEXT                            -- JSON: {name: "unemployed", ...}
charinfo TEXT                       -- JSON: {firstname, lastname, birthdate, ...}
skin TEXT                           -- JSON veya NULL
```

### playerskins Tablosu
```sql
citizenid VARCHAR(50)
model VARCHAR(50)
skin TEXT                           -- JSON
active INT(11)                      -- 1 = aktif skin
```

## Identifier Sistemi

### ESX vs QBCore
- **ESX**: `identifier` (license:xxxxx)
- **QBCore**: `citizenid` (char1:license)

### Config.Prefix
```lua
Config.Prefix = 'char'  -- char1, char2, char3, ...
```

## Test Edilmesi Gerekenler

✅ Server başlatma (hata yok)
✅ Karakter listesi yükleme
✅ Karakter oluşturma
✅ Karakter seçme
✅ Karakter silme
✅ Skin/appearance yükleme
✅ Job bilgisi gösterme
✅ Para bilgisi gösterme

## Sorun Giderme

### Hala ESX Hatası Alıyorsanız:
1. Server'ı tamamen kapatın
2. `ensure [exe-eklenti]` satırının `ensure qb-core`'dan sonra olduğundan emin olun
3. Server'ı yeniden başlatın

### Karakter Listesi Boş Geliyorsa:
1. Database'de `players` tablosunu kontrol edin
2. `citizenid` formatının `char%:license` olduğundan emin olun
3. `Config.Prefix = 'char'` olduğundan emin olun

### Skin Yüklenm iyorsa:
1. `playerskins` tablosunu kontrol edin
2. `active = 1` olan kayıt olduğundan emin olun
3. fivem-appearance'ın çalıştığından emin olun

## Tarih
- **Düzeltme Tarihi**: 2026-04-07
- **Düzelten**: Kiro AI Assistant
- **Sebep**: ESX → QBCore framework değişimi
