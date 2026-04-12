local QBCore = exports['qb-core']:GetCoreObject()
local isWelcomeActive = false

-- Modern karşılama UI göster
local function ShowWelcomeUI()
    if isWelcomeActive then return end
    isWelcomeActive = true
    
    -- Ana karşılama alert
    lib.alertDialog({
        header = Config.WelcomeTitle,
        content = 'Nexora Roleplay ailesine hoş geldin! Hayatına başlamak için gerekli bilgileri alacaksın.',
        centered = true,
        cancel = false
    })
    
    -- Başlangıç itemlerini iste
    TriggerServerEvent('swx_welcome:giveStarterItems')
    
    -- GPS işareti ekle (iş merkezi)
    SetNewWaypoint(Config.JobCenterCoords.x, Config.JobCenterCoords.y)
    
    -- Sırayla mesajları göster
    Citizen.CreateThread(function()
        for i, msg in ipairs(Config.Messages) do
            -- Pozisyon belirle
            local position = Config.UIPosition == 'left' and 'center-left' or 'bottom'
            
            lib.notify({
                title = msg.title,
                description = msg.description,
                type = 'info',
                duration = msg.duration,
                position = position,
                icon = msg.icon,
                iconColor = '#00D4FF'
            })
            
            Wait(msg.duration + 1000) -- Mesaj süresi + 1 saniye bekle
        end
        
        -- Karşılama bitti
        isWelcomeActive = false
    end)
end

-- Yeni oyuncu kontrolü
RegisterNetEvent('swx_welcome:checkNewPlayer', function()
    local isNew = lib.callback.await('swx_welcome:isNewPlayer', false)
    
    if isNew then
        -- Kısa gecikme ile göster (karakter spawn olana kadar)
        Wait(2000)
        ShowWelcomeUI()
    end
end)

-- Komut: Karşılamayı tekrar göster (admin için)
RegisterCommand('testwelcome', function()
    if LocalPlayer.state.isLoggedIn then
        ShowWelcomeUI()
    end
end, false)

-- Login olduğunda kontrol et
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- Server kontrolü yap
    local isNew = lib.callback.await('swx_welcome:isNewPlayer', false)

    if isNew then
        -- Kısa gecikme ile göster (karakter spawn olana kadar)
        Wait(2000)
        ShowWelcomeUI()
    end
end)

print('[SWX-Welcome] Client yüklendi!')
