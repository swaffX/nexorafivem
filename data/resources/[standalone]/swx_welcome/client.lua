local QBCore = exports['qb-core']:GetCoreObject()
local isWelcomeActive = false

-- Modern karşılama UI göster
local function ShowWelcomeUI()
    if isWelcomeActive then return end
    isWelcomeActive = true

    -- Başlangıç itemlerini iste
    TriggerServerEvent('swx_welcome:giveStarterItems')

    -- GPS işareti ekle (iş merkezi)
    SetNewWaypoint(Config.JobCenterCoords.x, Config.JobCenterCoords.y)

    -- Ana hoş geldin mesajı
    lib.notify({
        title = Config.WelcomeTitle,
        description = 'Nexora Roleplay ailesine hoş geldin! Hayatına başlamak için gerekli bilgileri alacaksın.',
        type = 'success',
        duration = 6000,
        position = 'top',
        icon = 'party-popper',
        iconColor = '#00D4FF'
    })

    Wait(6500) -- Ana mesajın bitmesini bekle

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

-- Karakter oluşturulup appearance onaylandıktan sonra welcome göster
RegisterNetEvent('swx_welcome:checkNewPlayer', function()
    print('[SWX-Welcome] swx_welcome:checkNewPlayer event fired')
    local isNew = lib.callback.await('swx_welcome:isNewPlayer', false)
    print('[SWX-Welcome] isNewPlayer callback result: ' .. tostring(isNew))

    if isNew then
        Wait(1500)
        print('[SWX-Welcome] Showing welcome UI')
        ShowWelcomeUI()
    else
        print('[SWX-Welcome] Player is not new, skipping welcome')
    end
end)

-- Eski giriş kontrolü - sadece yeniden bağlanma için
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- Yeni karakter için welcome, appearance onayından gelir
    -- Bu event sadece mevcut karakterlerle bağlanma için
end)

print('[SWX-Welcome] Client yüklendi!')
