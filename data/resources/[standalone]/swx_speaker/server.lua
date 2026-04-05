-- SWX Speaker - Server Side
-- Kalıcı Müzik Geçmişi Sistemi

local QBCore = exports['qb-core']:GetCoreObject()

-- YouTube Audio Extract Cache (sunucu belleğinde sakla)
local audioCache = {} -- { [videoId] = { title, duration, timestamp, extractNeeded } }
local CACHE_EXPIRY = 3600 -- 1 saat (saniye)
-- NOT: Google Video URL'leri expire oluyor, bu yüzden sadece metadata cache'liyoruz
-- Her playback'te yeni URL extract edilecek

-- YouTube Title Çekme (oEmbed API kullanarak)
QBCore.Functions.CreateCallback('swx_speaker:getYouTubeTitle', function(source, cb, url)
    -- Video ID'yi çıkar
    local videoId = string.match(url, '[?&]v=([^&]+)') or string.match(url, 'youtu%.be/([^?]+)')
    
    if not videoId then
        print('[SWX Speaker] Geçersiz YouTube URL: ' .. url)
        cb(nil)
        return
    end
    
    -- YouTube oEmbed API kullan (API key gerektirmez)
    local apiUrl = 'https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=' .. videoId .. '&format=json'
    
    PerformHttpRequest(apiUrl, function(statusCode, response, headers)
        if statusCode == 200 and response then
            local success, data = pcall(function() return json.decode(response) end)
            
            if success and data and data.title then
                print('[SWX Speaker] YouTube title alındı: ' .. data.title)
                cb(data.title)
            else
                print('[SWX Speaker] JSON parse hatası')
                cb(nil)
            end
        else
            print('[SWX Speaker] HTTP hatası: ' .. statusCode)
            cb(nil)
        end
    end, 'GET')
end)

-- YouTube Audio Extract (Kendi VPS extractor servisini kullan + Cache)
RegisterNetEvent('swx_speaker:server:extractYouTubeAudio', function(videoUrl, musicId, volume, distance, coords, requestId)
    local src = source
    
    -- Video ID'yi çıkar
    local videoId = string.match(videoUrl, '[?&]v=([^&]+)') or string.match(videoUrl, 'youtu%.be/([^?]+)')
    
    if not videoId then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz YouTube URL!', 'error')
        return
    end
    
    -- CACHE KONTROLÜ: Metadata cache var mı? (title, duration)
    local cached = audioCache[videoId]
    local useCache = cached and (os.time() - cached.timestamp) < CACHE_EXPIRY
    
    if useCache then
        print('[SWX Speaker Server] Metadata cache hit: ' .. videoId)
        print('[SWX Speaker Server] Title:', cached.title)
        -- URL her zaman fresh extract edilir (expire olmaması için)
    end
    
    print('[SWX Speaker Server] Extracting fresh audio URL: ' .. videoId)
    
    -- Kendi localhost extractor servisimiz
    local extractorUrl = 'http://localhost:3000/extract?url=' .. videoUrl
    
    PerformHttpRequest(extractorUrl, function(statusCode, response, headers)
        if statusCode == 200 and response then
            local success, data = pcall(function() return json.decode(response) end)
            
            if success and data and data.success and data.url then
                -- CACHE'E METADATA KAYDET (sadece title, duration - URL expire oluyor)
                audioCache[videoId] = {
                    title = data.title or 'YouTube Şarkı',
                    duration = data.duration or 0,
                    timestamp = os.time()
                }
                
                print('[SWX Speaker Server] Sending fresh URL to client with requestId:', requestId)
                
                -- Client'a gönder (her zaman fresh URL)
                TriggerClientEvent('swx_speaker:client:playExtractedAudio', src, data.url, musicId, volume, distance, coords, data.title, videoUrl, requestId)
            else
                TriggerClientEvent('QBCore:Notify', src, 'YouTube sesi çıkarılamadı!', 'error')
            end
        elseif statusCode == 0 then
            TriggerClientEvent('QBCore:Notify', src, 'Extractor servisi çalışmıyor!', 'error')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Extractor hatası!', 'error')
        end
    end, 'GET')
end)

-- Müzik geçmişini yükle
RegisterNetEvent('swx_speaker:server:loadHistory', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.fetchAll('SELECT * FROM speaker_history WHERE citizenid = @citizenid ORDER BY played_at DESC LIMIT 50', {
            ['@citizenid'] = citizenid
        }, function(result)
            if result and #result > 0 then
                local history = {}
                for _, row in ipairs(result) do
                    table.insert(history, {
                        url = row.url,
                        title = row.title,
                        timestamp = row.played_at
                    })
                end
                TriggerClientEvent('swx_speaker:client:receiveHistory', src, history)
            else
                TriggerClientEvent('swx_speaker:client:receiveHistory', src, {})
            end
        end)
    end
end)

-- Müzik geçmişine ekle
RegisterNetEvent('swx_speaker:server:addToHistory', function(url, title)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        local timestamp = os.time()
        
        -- Debug log
        print(string.format('[SWX Speaker Server] Geçmişe ekleniyor: Title="%s" | URL="%s"', 
            title or 'NIL', url or 'NIL'))
        
        MySQL.Async.execute('INSERT INTO speaker_history (citizenid, url, title, played_at) VALUES (@citizenid, @url, @title, @timestamp)', {
            ['@citizenid'] = citizenid,
            ['@url'] = url,
            ['@title'] = title,
            ['@timestamp'] = timestamp
        }, function(affectedRows)
            if affectedRows > 0 then
                print('[SWX Speaker Server] Başarıyla kaydedildi: ' .. affectedRows .. ' satır')
                
                -- Eski kayıtları temizle (50'den fazlaysa)
                MySQL.Async.execute([[
                    DELETE FROM speaker_history 
                    WHERE citizenid = @citizenid 
                    AND id NOT IN (
                        SELECT id FROM (
                            SELECT id FROM speaker_history 
                            WHERE citizenid = @citizenid 
                            ORDER BY played_at DESC 
                            LIMIT 50
                        ) AS temp
                    )
                ]], {
                    ['@citizenid'] = citizenid
                })
            else
                print('[SWX Speaker Server] HATA: Kayıt başarısız!')
            end
        end)
    end
end)

-- Müzik geçmişinden sil (URL bazlı - tüm duplicate'leri sil)
RegisterNetEvent('swx_speaker:server:removeFromHistoryByUrl', function(url)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.execute('DELETE FROM speaker_history WHERE citizenid = @citizenid AND url = @url', {
            ['@citizenid'] = citizenid,
            ['@url'] = url
        }, function(affectedRows)
            print('[SWX Speaker Server] Silindi: ' .. affectedRows .. ' kayıt (URL: ' .. url .. ')')
        end)
    end
end)

-- Müzik geçmişinden sil (eski - timestamp bazlı)
RegisterNetEvent('swx_speaker:server:removeFromHistory', function(url, timestamp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.execute('DELETE FROM speaker_history WHERE citizenid = @citizenid AND url = @url AND played_at = @timestamp', {
            ['@citizenid'] = citizenid,
            ['@url'] = url,
            ['@timestamp'] = timestamp
        })
    end
end)

-- Tüm geçmişi temizle
RegisterNetEvent('swx_speaker:server:clearHistory', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.execute('DELETE FROM speaker_history WHERE citizenid = @citizenid', {
            ['@citizenid'] = citizenid
        })
    end
end)
