local lastFPS = 0
local fpsHistory = {}
local maxHistory = 10
local lastFPSAlert = 0
local fpsDropCount = 0

-- FPS hesaplama
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local currentFPS = math.floor(1 / GetFrameTime())
        lastFPS = currentFPS

        -- FPS geçmişini tut
        table.insert(fpsHistory, currentFPS)
        if #fpsHistory > maxHistory then
            table.remove(fpsHistory, 1)
        end

        -- FPS düşüşü kontrolü
        if Config.MonitorFPS and currentFPS < Config.FPSDropThreshold then
            local currentTime = GetGameTimer() / 1000
            if currentTime - lastFPSAlert > Config.CooldownTime then
                fpsDropCount = fpsDropCount + 1
                lastFPSAlert = currentTime

                local avgFPS = 0
                for _, fps in ipairs(fpsHistory) do
                    avgFPS = avgFPS + fps
                end
                avgFPS = math.floor(avgFPS / #fpsHistory)

                TriggerServerEvent('nexora-perfmon:fpsAlert', {
                    currentFPS = currentFPS,
                    averageFPS = avgFPS,
                    dropCount = fpsDropCount,
                    playerName = GetPlayerName(PlayerId()),
                })

                if Config.LogToConsole then
                    print('^1[NEXORA-PERFMON] ^3FPS DÜŞÜŞÜ: ^0' .. currentFPS .. ' FPS (Ortalama: ' .. avgFPS .. ')')
                end
            end
        end
    end
end)

-- Periyodik rapor
if Config.PeriodicReport then
    Citizen.CreateThread(function()
        Citizen.Wait(10000) -- İlk 10 saniye bekle
        while true do
            Citizen.Wait(Config.ReportInterval)

            local avgFPS = 0
            for _, fps in ipairs(fpsHistory) do
                avgFPS = avgFPS + fps
            end
            if #fpsHistory > 0 then
                avgFPS = math.floor(avgFPS / #fpsHistory)
            end

            local minFPS = 999
            local maxFPS = 0
            for _, fps in ipairs(fpsHistory) do
                if fps < minFPS then minFPS = fps end
                if fps > maxFPS then maxFPS = fps end
            end

            TriggerServerEvent('nexora-perfmon:periodicReport', {
                averageFPS = avgFPS,
                minFPS = minFPS,
                maxFPS = maxFPS,
                playerName = GetPlayerName(PlayerId()),
                playerCount = #GetActivePlayers(),
            })
        end
    end)
end
