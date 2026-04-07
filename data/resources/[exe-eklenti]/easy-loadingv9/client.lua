AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("Easy Loading ekranı başarıyla tamamlandı!")
end)

local active = true

Citizen.CreateThread(function()
    while active do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 22) then -- 22 = SPACE tuşu
            ShutdownLoadingScreen()
            ShutdownLoadingScreenNui()
            active = false
        end
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    SendLoadingScreenMessage(json.encode({
        type = "init",
        resourceName = GetCurrentResourceName()
    }))
end)


AddEventHandler('onClientResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        print("^2[easy Loading] ^7Yükleme ekranı başarıyla tamamlandı.")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            ShutdownLoadingScreen()
            ShutdownLoadingScreenNui()
            return
        end
    end
end)

Citizen.CreateThread(function()
    local lastProgress = 0
    
    while true do
        Citizen.Wait(500)
        if not NetworkIsSessionStarted() then
            local progress = GetGameTimer() % 100
            if progress ~= lastProgress then
                SendNUIMessage({
                    type = 'updateProgress',
                    progress = progress
                })
                
                lastProgress = progress
            end
        else
            SendNUIMessage({
                type = 'updateProgress',
                progress = 100
            })
            return
        end
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    SendLoadingScreenMessage(json.encode({
        type = 'updateProgress',
        data = {
            progress = 0
        }
    }))
end)

Citizen.CreateThread(function()
    while true do
        if GetGameTimer() < 5000 then 
            Citizen.Wait(500)
            goto continue
        end

        local playerIdx = GetPlayerFromServerId(GetPlayerServerId(PlayerId()))
        if not playerIdx then 
            Citizen.Wait(250)
            goto continue
        end

        local progress = 0
        
        if GetResourceState('sessionmanager') == 'started' then
            progress = progress + 20
        end
        
        if HasCollisionLoadedAroundEntity(PlayerPedId()) then
            progress = progress + 30
        end
        
        if NetworkIsPlayerActive(playerIdx) then
            progress = progress + 30
        end
        
        if IsScreenFadedIn() and NetworkIsSessionStarted() then
            progress = 100
        end
        
        SendLoadingScreenMessage(json.encode({
            type = 'updateProgress',
            data = {
                progress = progress
            }
        }))
        
        if progress >= 100 then
            Citizen.Wait(2000) 
            ShutdownLoadingScreen()
            ShutdownLoadingScreenNui()
            break
        end
        
        ::continue::
        Citizen.Wait(500)
    end
end)

-- Harici linkleri açmak için NUI callback fonksiyonları
RegisterNUICallback('openExternalLink', function(data, cb)
    print("Harici link açma isteği alındı: " .. (data.url or "bilinmeyen URL"))
    
    if data.url and type(data.url) == 'string' then
        -- Linki doğrula (basit güvenlik kontrolü)
        local validDomains = {
            "youtube.com", "youtu.be", "twitter.com", "instagram.com", 
            "discord.com", "discord.gg", "facebook.com", "twitch.tv"
        }
        
        local isValid = false
        for _, domain in ipairs(validDomains) do
            if string.find(data.url:lower(), domain) then
                isValid = true
                break
            end
        end
        
        if isValid then
            print("Geçerli link açılıyor: " .. data.url)
            ActivateUrl(data.url)
        else
            print("Geçersiz link algılandı ve engellendi: " .. data.url)
        end
    else
        print("Geçersiz URL format")
    end
    
    cb({status = "ok"})
end) 