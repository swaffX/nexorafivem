local alertCount = 0
local lastAlertReset = os.time()
local resourceTimings = {}

-- Discord Webhook gönderme fonksiyonu
function SendToDiscord(title, message, color, fields)
    if Config.WebhookURL == "DISCORD_WEBHOOK_URL_BURAYA" or Config.WebhookURL == "" then
        print("^1[NEXORA-PERFMON] ^3Webhook URL ayarlanmamış! config.lua dosyasını kontrol edin.^0")
        return
    end

    -- Spam koruması
    local currentTime = os.time()
    if currentTime - lastAlertReset >= 60 then
        alertCount = 0
        lastAlertReset = currentTime
    end

    alertCount = alertCount + 1
    if alertCount > Config.MaxAlertsPerMinute then
        if Config.LogToConsole then
            print("^3[NEXORA-PERFMON] Dakikalık uyarı limiti aşıldı, webhook gönderilmedi.^0")
        end
        return
    end

    local embed = {
        {
            ["title"] = title,
            ["description"] = message,
            ["color"] = color or Config.WebhookColor,
            ["footer"] = {
                ["text"] = "Nexora Performans Monitörü | " .. os.date("%d.%m.%Y %H:%M:%S"),
            },
            ["thumbnail"] = {
                ["url"] = Config.WebhookAvatar ~= "" and Config.WebhookAvatar or nil,
            },
        }
    }

    -- Fields ekle
    if fields and #fields > 0 then
        embed[1]["fields"] = fields
    end

    PerformHttpRequest(Config.WebhookURL, function(err, text, headers)
        if err ~= 200 and err ~= 204 then
            print("^1[NEXORA-PERFMON] Webhook gönderim hatası: ^0" .. tostring(err))
        end
    end, 'POST', json.encode({
        username = Config.WebhookName,
        avatar_url = Config.WebhookAvatar ~= "" and Config.WebhookAvatar or nil,
        embeds = embed,
    }), { ['Content-Type'] = 'application/json' })
end

-- FPS düşüşü uyarısı
RegisterNetEvent('nexora-perfmon:fpsAlert')
AddEventHandler('nexora-perfmon:fpsAlert', function(data)
    local src = source
    local playerName = GetPlayerName(src) or "Bilinmiyor"
    local identifier = GetPlayerIdentifierByType(src, 'fivem') or "N/A"

    local fields = {
        { name = "👤 Oyuncu", value = playerName, inline = true },
        { name = "🆔 ID", value = tostring(src), inline = true },
        { name = "📊 Anlık FPS", value = tostring(data.currentFPS), inline = true },
        { name = "📈 Ortalama FPS", value = tostring(data.averageFPS), inline = true },
        { name = "⚠️ Toplam Düşüş", value = tostring(data.dropCount), inline = true },
        { name = "🔑 Identifier", value = identifier, inline = true },
    }

    local severity = "⚠️ UYARI"
    local color = Config.WarningColor

    if data.currentFPS < 15 then
        severity = "🔴 KRİTİK"
        color = Config.ErrorColor
    end

    SendToDiscord(
        severity .. " | FPS Düşüşü Algılandı",
        "Bir oyuncuda performans sorunu tespit edildi.",
        color,
        fields
    )

    if Config.LogToConsole then
        print("^1[NEXORA-PERFMON] ^3FPS Düşüşü - ^0" .. playerName .. " (" .. src .. "): " .. data.currentFPS .. " FPS")
    end
end)

-- Periyodik rapor
RegisterNetEvent('nexora-perfmon:periodicReport')
AddEventHandler('nexora-perfmon:periodicReport', function(data)
    local src = source
    local playerName = GetPlayerName(src) or "Bilinmiyor"

    if Config.DetailedLog then
        local fields = {
            { name = "👤 Oyuncu", value = playerName, inline = true },
            { name = "📊 Ort. FPS", value = tostring(data.averageFPS), inline = true },
            { name = "📉 Min FPS", value = tostring(data.minFPS), inline = true },
            { name = "📈 Max FPS", value = tostring(data.maxFPS), inline = true },
            { name = "👥 Aktif Oyuncu", value = tostring(data.playerCount), inline = true },
        }

        SendToDiscord(
            "📋 Periyodik Performans Raporu",
            "Otomatik performans raporu gönderildi.",
            Config.SuccessColor,
            fields
        )
    end
end)

-- Resource izleme (server tarafı)
if Config.MonitorResourceUsage then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(Config.CheckInterval)

            local playerCount = #GetPlayers()
            local resources = GetNumResources()
            local highUsageResources = {}

            for i = 0, resources - 1 do
                local resName = GetResourceByFindIndex(i)
                if resName and GetResourceState(resName) == 'started' then
                    -- Resource durumunu kontrol et
                    local state = GetResourceState(resName)
                    if state == 'started' then
                        -- Basit kaynak takibi
                    end
                end
            end

            if Config.LogToConsole and Config.DetailedLog then
                print("^2[NEXORA-PERFMON] ^0Kontrol tamamlandı - " .. playerCount .. " oyuncu aktif, " .. resources .. " resource yüklü")
            end
        end
    end)
end

-- Sunucu başlangıç bildirimi
Citizen.CreateThread(function()
    Citizen.Wait(5000) -- 5 saniye bekle

    local resourceCount = GetNumResources()
    local startedCount = 0
    for i = 0, resourceCount - 1 do
        local resName = GetResourceByFindIndex(i)
        if resName and GetResourceState(resName) == 'started' then
            startedCount = startedCount + 1
        end
    end

    local fields = {
        { name = "📦 Toplam Resource", value = tostring(resourceCount), inline = true },
        { name = "✅ Aktif Resource", value = tostring(startedCount), inline = true },
        { name = "👥 Max Oyuncu", value = tostring(GetConvarInt('sv_maxclients', 32)), inline = true },
    }

    SendToDiscord(
        "🟢 Sunucu Başlatıldı",
        "Nexora Roleplay sunucusu başarıyla başlatıldı. Performans izleme aktif.",
        Config.SuccessColor,
        fields
    )

    print("^2[NEXORA-PERFMON] ^0Performans monitörü başlatıldı!")
    print("^2[NEXORA-PERFMON] ^0" .. startedCount .. "/" .. resourceCount .. " resource aktif")
end)

-- Resource hata izleme
if Config.MonitorErrors then
    AddEventHandler('onResourceStop', function(resourceName)
        if resourceName == GetCurrentResourceName() then return end

        local fields = {
            { name = "📦 Resource", value = resourceName, inline = true },
            { name = "⏰ Zaman", value = os.date("%H:%M:%S"), inline = true },
        }

        SendToDiscord(
            "⏹️ Resource Durduruldu",
            "Bir resource durduruldu: **" .. resourceName .. "**",
            Config.WarningColor,
            fields
        )

        if Config.LogToConsole then
            print("^3[NEXORA-PERFMON] ^0Resource durduruldu: " .. resourceName)
        end
    end)

    AddEventHandler('onResourceStart', function(resourceName)
        if resourceName == GetCurrentResourceName() then return end

        if Config.DetailedLog then
            print("^2[NEXORA-PERFMON] ^0Resource başlatıldı: " .. resourceName)
        end
    end)
end
