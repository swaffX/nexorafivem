# WAIS-HUD Hata Düzeltme Raporu
**Tarih:** 4 Nisan 2026  
**Durum:** Analiz Tamamlandı - Çözümler Hazır

---

## 🔴 SORUN 1: Blip Konumlandırma Hatası
### Belirti
- Harita üzerindeki blip'ler (işaretçiler) haritanın sağ alt ve sol alt köşelerinde takılı kalıyor
- Gerçek konum uzakta olmasına rağmen blip'ler harita kenarlarında görünüyor

### Kök Neden
**WAIS-HUD'da blip konumlandırma sistemi YOK!**

Kod analizi sonucu:
- `client/client.lua` dosyasında blip oluşturma/konumlandırma fonksiyonu bulunamadı
- `SetBlipCoords`, `AddBlipForCoord`, `SetBlipSprite` gibi native'ler kullanılmamış
- Minimap pozisyonlama sadece harita maskesi için yapılmış (satır 700-850)

### Çözüm
Bu sorun **WAIS-HUD'dan kaynaklanmıyor**. Blip sistemi başka bir script tarafından yönetiliyor olmalı.

**Kontrol edilmesi gereken scriptler:**
1. `qb-core/client/blips.lua` veya benzeri
2. `esx_blips` veya `qb-blips` gibi blip yönetim scriptleri
3. `qb-target` veya `ox_target` (target blip'leri)
4. Meslek scriptleri (kaves_mechanic, hb_farming vb.)

**Önerilen çözüm adımları:**
```lua
-- Blip oluşturan scripti bul ve şu kontrolü ekle:
local blip = AddBlipForCoord(x, y, z)
SetBlipSprite(blip, sprite)
SetBlipDisplay(blip, 4) -- BURAYI KONTROL ET
SetBlipScale(blip, scale)
SetBlipColour(blip, colour)
SetBlipAsShortRange(blip, true) -- Uzakta gizle
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(name)
EndTextCommandSetBlipName(blip)
```

---

## 🔴 SORUN 2: Konum İsmi Güncellenmiyor ("Posta Yakını" Donuyor)
### Belirti
- Harita üstünde "Posta Yakını" yazısı görünüyor
- Bulunulan yerin gerçek ismi (sokak/bölge adı) gösterilmiyor
- Metin donmuş gibi hiç değişmiyor

### Kök Neden
**Sokak isimleri KASITLI OLARAK KALDIRILMIŞ!**

`client/client.lua` satır 700-850 arası:
```lua
-- Compass and Street Name Thread
CreateThread(function()
    while true do
        -- ...
        -- Street names removed - set to empty
        local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = "" -- Removed: GetStreetNameFromHashKey(streetHash)
        local crossingName = "" -- Removed: GetStreetNameFromHashKey(crossingHash)
        
        SendNUIMessage({
            type = "UPDATE_COMPASS",
            compass = getCompassDirection(heading),
            title = "", -- Street name removed
            subtitle = "" -- Crossing name removed
        })
```

### Çözüm
Sokak isimlerini geri ekle:


```lua
-- DÜZELTME: client/client.lua satır ~700-850 arası
CreateThread(function()
    while true do
        local sleepTime = 1000
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        
        if wFramework.playerLoaded then
            if Config.ShowMapOnFoot or Player.vehicle.vehicle > 0 then
                if next(Player.customizations) then
                    sleepTime = Config.RefreshTimes.compass[Player.customizations.performance]
                    
                    -- Sokak isimlerini geri ekle
                    local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                    local streetName = GetStreetNameFromHashKey(streetHash)
                    local crossingName = GetStreetNameFromHashKey(crossingHash)
                    
                    -- Eğer sokak ismi yoksa bölge ismini göster
                    if streetName == "" or streetName == nil then
                        local zoneHash = GetNameOfZone(coords.x, coords.y, coords.z)
                        streetName = GetLabelText(zoneHash)
                    end
                    
                    SendNUIMessage({
                        type = "UPDATE_COMPASS",
                        compass = getCompassDirection(heading),
                        title = streetName, -- Sokak ismi eklendi
                        subtitle = crossingName -- Kavşak ismi eklendi
                    })
                    
                    -- Postal kodu güncelleme (zaten var)
                    if Config.PostalMap.showNearPostal then
                        if Postals and #Postals > 0 then
                            local nearestPostal = nil
                            local minDistance = math.huge
                            
                            for i = 1, #Postals do
                                local postal = Postals[i]
                                local distance = #(vector2(coords.x, coords.y) - vector2(postal.x, postal.y))
                                
                                if distance < minDistance then
                                    minDistance = distance
                                    nearestPostal = postal
                                end
                            end
                            
                            if nearestPostal then
                                SendNUIMessage({
                                    type = "UPDATE_POSTAL",
                                    postal = nearestPostal.code
                                })
                            end
                        end
                    end
                end
            end
        end
        
        Wait(sleepTime)
    end
end)
```

**Not:** "Posta Yakını" metni `web/public/locales/tr.json` dosyasında tanımlı:
```json
"location": {
    "nearPostal": "Posta Yakını"
}
```
Bu metin postal kodu gösterildiğinde kullanılıyor. Sokak ismi ise `title` alanında gösterilecek.

---

## 🔴 SORUN 3: Müzik Sistemi - Yakındaki Oyuncular Duyuyor mu?
### Belirti
- M tuşuna basınca açılan menüden şarkı açılıyor
- Arabadayken etraftaki insanların duyup duymadığı bilinmiyor

### Analiz Sonucu
**MÜZİK SİSTEMİ SENKRONIZE DEĞİL - SADECE OYNATICI DUYUYOR!**

Kod analizi (`client/client.lua` satır 1-400):
```lua
-- Play Sound in Vehicle
RegisterNUICallback("playSound", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        return cb("ok")
    end
    
    if not Player.vehicle.canPlayMusic then
        return cb("ok")
    end
    
    -- Destroy existing sound if present
    if Player.vehicle.soundData ~= nil then
        if xSound:soundExists(Player.vehicle.soundData.id) then
            xSound:Destroy(Player.vehicle.soundData.id)
        end
    end
    
    -- Set up new sound
    data.data.vehicle = NetworkGetNetworkIdFromEntity(Player.vehicle.vehicle)
    data.data.volume = data.volume
    Player.vehicle.soundData = data.data
    
    -- ⚠️ SORUN BURADA: xSound:PlayUrl sadece CLIENT-SIDE çalışıyor
    xSound:PlayUrl(data.data.id, data.data.url, data.data.volume, false)
    cb("ok")
end)
```

### Kök Neden
1. **xSound resource'u YOK:** Sunucuda `xsound` resource'u bulunamadı
2. **Client-side oynatma:** Müzik sadece oynatıcının bilgisayarında çalıyor
3. **Senkronizasyon yok:** Diğer oyunculara müzik bilgisi gönderilmiyor

### Config Ayarı
`config.lua` satır 30-35:
```lua
Config.MusicSystem = {
    ["disable"] = false,
    ["distance"] = 10.0, -- Mesafe ayarı var AMA kullanılmıyor!
}
```

### Çözüm Seçenekleri

#### SEÇENEK 1: xSound Resource'unu Kur (ÖNERİLEN)
```bash
# xSound'u indir ve kur
# GitHub: https://github.com/Xogy/xsound

# server.cfg'ye ekle:
ensure xsound
ensure wais-hudv6
```

xSound kurulduktan sonra müzik sistemi otomatik olarak senkronize çalışacak.

#### SEÇENEK 2: Müzik Sistemini Devre Dışı Bırak
```lua
-- config.lua
Config.MusicSystem = {
    ["disable"] = true, -- Müzik sistemini kapat
    ["distance"] = 10.0,
}
```

#### SEÇENEK 3: Server-Side Senkronizasyon Ekle
xSound yoksa alternatif bir sistem kur:

**server.lua ekle:**
```lua
-- Müzik senkronizasyonu
local activeSounds = {}

RegisterNetEvent("wais:hudv6:server:playSound", function(soundData)
    local src = source
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    
    activeSounds[src] = {
        data = soundData,
        coords = playerCoords
    }
    
    -- Yakındaki oyunculara gönder
    for _, playerId in ipairs(GetPlayers()) do
        local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
        local distance = #(playerCoords - targetCoords)
        
        if distance <= Config.MusicSystem.distance then
            TriggerClientEvent("wais:hudv6:client:receiveSound", playerId, soundData, distance)
        end
    end
end)

RegisterNetEvent("wais:hudv6:server:stopSound", function(soundId)
    local src = source
    activeSounds[src] = nil
    
    -- Yakındaki oyunculara durdurma komutu gönder
    for _, playerId in ipairs(GetPlayers()) do
        TriggerClientEvent("wais:hudv6:client:stopSound", playerId, soundId)
    end
end)
```

**client.lua'ya ekle:**
```lua
-- Müzik senkronizasyonu client
RegisterNetEvent("wais:hudv6:client:receiveSound", function(soundData, distance)
    -- Mesafeye göre ses seviyesi ayarla
    local volume = soundData.volume * (1 - (distance / Config.MusicSystem.distance))
    
    if xSound:soundExists(soundData.id) then
        xSound:Destroy(soundData.id)
    end
    
    xSound:PlayUrl(soundData.id, soundData.url, volume, false)
end)

RegisterNetEvent("wais:hudv6:client:stopSound", function(soundId)
    if xSound:soundExists(soundId) then
        xSound:Destroy(soundId)
    end
end)
```

---

## 📊 ÖZET

| Sorun | Durum | Çözüm |
|-------|-------|-------|
| Blip konumlandırma | ❌ WAIS-HUD'da değil | Başka script kontrol edilmeli |
| Konum ismi donuyor | ✅ Bulundu | Sokak isimlerini geri ekle |
| Müzik senkronizasyonu | ❌ Çalışmıyor | xSound kur veya devre dışı bırak |

---

## 🔧 UYGULAMA SIRASI

1. **Konum İsmi Düzeltmesi** (5 dakika)
   - `client/client.lua` dosyasını düzenle
   - Sokak isimlerini geri ekle
   - Sunucuyu restart et

2. **Müzik Sistemi Kararı** (10-30 dakika)
   - xSound kur (önerilen) VEYA
   - Müzik sistemini devre dışı bırak

3. **Blip Sorunu Araştırması** (30+ dakika)
   - Blip oluşturan scriptleri bul
   - F8 console'da hata kontrol et
   - Blip native'lerini düzelt

---

## ⚠️ ÖNEMLİ NOTLAR

1. **xSound Dependency:** WAIS-HUD müzik sistemi xSound'a bağımlı ama xSound kurulu değil
2. **Sokak İsimleri:** Kasıtlı olarak kaldırılmış, geri eklenebilir
3. **Blip Sistemi:** WAIS-HUD blip yönetmiyor, başka bir script sorumlu
4. **Performance:** Sokak ismi güncellemesi her 500-750ms yapılıyor (config'de ayarlanabilir)

---

**Hazırlayan:** Kiro AI Assistant  
**Versiyon:** 1.0
