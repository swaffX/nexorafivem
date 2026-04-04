-- ============================================
-- NPC DENSITY CONTROL
-- Reduces NPC spawns by 70% and optimizes performance
-- Only spawns NPCs near the player
-- PROTECTS JOB NPCs (Trucker, Bus Driver, etc.)
-- ============================================

local Config = {
    -- NPC Yoğunluğu (0.0 = Yok, 1.0 = Tam)
    PedDensity = 0.3,           -- Yaya yoğunluğu (%70 azaltma)
    VehicleDensity = 0.3,       -- Araç yoğunluğu (%70 azaltma)
    ParkedVehicleDensity = 0.3, -- Park edilmiş araç yoğunluğu (%70 azaltma)
    
    -- Spawn Mesafesi (sadece oyuncunun etrafında spawn olur)
    SpawnDistance = 150.0,      -- Oyuncudan 150 metre yakınında spawn
    
    -- Performans Ayarları
    UpdateInterval = 1000,      -- Her 1 saniyede bir güncelle (ms)
    
    -- Korunacak NPC Lokasyonları (Meslek NPC'leri)
    ProtectedZones = {
        -- Tırcılık Mesleği
        {coords = vector3(839.24, -2923.90, 5.89), radius = 50.0, name = "Trucker Job"},
        -- Otobüs Şoförlüğü
        {coords = vector3(454.23, -600.75, 28.57), radius = 50.0, name = "Bus Job"},
        -- İş Merkezi (wais-jobpack)
        {coords = vector3(-269.17, -955.43, 31.22), radius = 50.0, name = "Job Centre"},
        -- Pizza Teslimatı
        {coords = vector3(535.57, 101.70, 96.57), radius = 50.0, name = "Pizza Delivery"},
        -- Gazete Dağıtımı
        {coords = vector3(-599.24, -929.90, 23.85), radius = 50.0, name = "Newspaper Delivery"},
        -- Seyyar Sosisli
        {coords = vector3(44.05, -998.01, 29.33), radius = 50.0, name = "Mobile Hotdog"},
        -- Forklift Operatörü
        {coords = vector3(1207.45, -3122.25, 5.40), radius = 50.0, name = "Forklifter"},
        -- Bahçıvan
        {coords = vector3(-1329.78, 86.33, 54.50), radius = 50.0, name = "Gardener"},
        -- Kamyoncu (wais-jobpack)
        {coords = vector3(1240.35, -3257.20, 5.90), radius = 50.0, name = "Trucker Center"},
        -- Yol Yardımı
        {coords = vector3(-196.95, -1316.55, 31.30), radius = 50.0, name = "Road Helper"},
        -- Otobüs Şoförü (wais-jobpack)
        {coords = vector3(462.40, -602.05, 28.50), radius = 50.0, name = "Bus Driver Center"},
        -- İtfaiye
        {coords = vector3(-635.55, -117.95, 39.00), radius = 50.0, name = "Fire Department"},
        -- Avcı
        {coords = vector3(-679.15, 5834.05, 17.35), radius = 50.0, name = "Hunter"},
        -- Metal Dedektörü
        {coords = vector3(-1505.90, 1527.85, 115.30), radius = 50.0, name = "Metal Detectorist"},
        -- Proje Araba
        {coords = vector3(-199.85, -1318.05, 31.30), radius = 50.0, name = "Project Car"},
        -- Dalgıç
        {coords = vector3(-1612.15, 5260.85, 3.95), radius = 50.0, name = "Diver"},
        -- Çiftçi
        {coords = vector3(2035.85, 4985.85, 41.10), radius = 50.0, name = "Farmer"},
        -- Elektrikçi
        {coords = vector3(724.85, 134.05, 80.75), radius = 50.0, name = "Electrician"},
        {coords = vector3(-56.61, -1099.26, 26.86), radius = 40.0, name = "Vehicle Shop"},
        {coords = vector3(440.72, -1013.17, 27.62), radius = 40.0, name = "Police Shop"},
        {coords = vector3(-706.262, -1360.31, 4.1021), radius = 40.0, name = "Boat Shop"},
        {coords = vector3(1729.02, 3293.57, 40.19), radius = 40.0, name = "Aircraft Shop"},
        {coords = vector3(324.88, -229.86, 54.22), radius = 40.0, name = "Pinkcage Motel"},
        {coords = vector3(-655.18, -2401.98, 13.96), radius = 40.0, name = "Illegal Mechanic"},
        -- Buraya yeni meslek lokasyonları eklenebilir
    }
}

-- ============================================
-- YARDIMCI FONKSİYONLAR
-- ============================================

-- NPC'nin korunan bölgede olup olmadığını kontrol et
local function IsInProtectedZone(coords)
    for _, zone in ipairs(Config.ProtectedZones) do
        local distance = #(coords - zone.coords)
        if distance <= zone.radius then
            return true, zone.name
        end
    end
    return false
end

local function ShouldPreservePed(ped, playerPed)
    if ped == 0 or ped == playerPed or not DoesEntityExist(ped) then
        return true
    end

    if IsPedAPlayer(ped) or IsEntityAMissionEntity(ped) then
        return true
    end

    local populationType = GetEntityPopulationType(ped)
    if populationType == 6 or populationType == 7 then
        return true
    end

    -- GetEntityInvincible native'i mevcut değil, IsEntityPositionFrozen yeterli
    if IsEntityPositionFrozen(ped) then
        return true
    end

    return false
end

local function ShouldPreserveVehicle(vehicle)
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        return true
    end

    if IsEntityAMissionEntity(vehicle) then
        return true
    end

    local populationType = GetEntityPopulationType(vehicle)
    if populationType == 6 or populationType == 7 then
        return true
    end

    -- GetEntityInvincible native'i mevcut değil, IsEntityPositionFrozen yeterli
    if IsEntityPositionFrozen(vehicle) then
        return true
    end

    return false
end

-- ============================================
-- NPC YOĞUNLUĞU AYARLARI
-- ============================================

CreateThread(function()
    while true do
        Wait(0) -- Her frame çalışmalı
        
        -- Yaya yoğunluğunu azalt
        SetPedDensityMultiplierThisFrame(Config.PedDensity)
        SetScenarioPedDensityMultiplierThisFrame(Config.PedDensity, Config.PedDensity)
        
        -- Araç yoğunluğunu azalt
        SetVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
        SetRandomVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
        SetParkedVehicleDensityMultiplierThisFrame(Config.ParkedVehicleDensity)
        
        -- Trafik yoğunluğunu azalt
        SetVehicleModelIsSuppressed(GetHashKey("POLICE"), true)
        SetVehicleModelIsSuppressed(GetHashKey("POLICE2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("POLICE3"), true)
        SetVehicleModelIsSuppressed(GetHashKey("POLICE4"), true)
        SetVehicleModelIsSuppressed(GetHashKey("POLICEB"), true)
        SetVehicleModelIsSuppressed(GetHashKey("POLICET"), true)
        SetVehicleModelIsSuppressed(GetHashKey("SHERIFF"), true)
        SetVehicleModelIsSuppressed(GetHashKey("SHERIFF2"), true)
    end
end)

-- ============================================
-- UZAK NPC'LERİ TEMİZLE (Performans İyileştirmesi)
-- Meslek NPC'lerini KORUR
-- ============================================

CreateThread(function()
    while true do
        Wait(Config.UpdateInterval)
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        -- Uzaktaki yayaları temizle (ama meslek NPC'lerini koru)
        for ped in EnumeratePeds() do
            if not ShouldPreservePed(ped, playerPed) then
                local pedCoords = GetEntityCoords(ped)
                local distance = #(playerCoords - pedCoords)
                
                -- Korunan bölgede mi kontrol et
                local isProtected, zoneName = IsInProtectedZone(pedCoords)
                
                -- Oyuncudan çok uzaktaysa VE korunan bölgede değilse sil
                if distance > Config.SpawnDistance * 2 and not isProtected then
                    DeleteEntity(ped)
                end
            end
        end
        
        -- Uzaktaki araçları temizle
        for vehicle in EnumerateVehicles() do
            local driver = GetPedInVehicleSeat(vehicle, -1)
            
            -- Eğer araçta oyuncu yoksa
            if not IsPedAPlayer(driver) and not ShouldPreserveVehicle(vehicle) then
                local vehCoords = GetEntityCoords(vehicle)
                local distance = #(playerCoords - vehCoords)
                
                -- Korunan bölgede mi kontrol et
                local isProtected = IsInProtectedZone(vehCoords)
                
                -- Oyuncudan çok uzaktaysa VE korunan bölgede değilse sil
                if distance > Config.SpawnDistance * 2 and not isProtected then
                    DeleteEntity(vehicle)
                end
            end
        end
    end
end)

-- ============================================
-- ENTITY ENUMERATOR (Yardımcı Fonksiyonlar)
-- ============================================

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

-- ============================================
-- KONSOL MESAJI
-- ============================================

CreateThread(function()
    Wait(1000)
    print("^2[NPC Control]^0 NPC yoğunluğu %70 azaltıldı")
    print("^2[NPC Control]^0 Spawn mesafesi: " .. Config.SpawnDistance .. " metre")
    print("^2[NPC Control]^0 Performans optimizasyonu aktif")
    print("^2[NPC Control]^0 " .. #Config.ProtectedZones .. " meslek bölgesi korunuyor")
end)

-- ============================================
-- EXPORTS (Diğer scriptler için)
-- ============================================

exports('GetConfig', function()
    return Config
end)

exports('SetPedDensity', function(density)
    Config.PedDensity = density
end)

exports('SetVehicleDensity', function(density)
    Config.VehicleDensity = density
end)

exports('SetSpawnDistance', function(distance)
    Config.SpawnDistance = distance
end)
