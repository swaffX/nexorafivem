-- SWX Speaker - Server Side
-- Kalıcı Müzik Geçmişi Sistemi

local QBCore = exports['qb-core']:GetCoreObject()

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

-- YouTube Audio Extract (Piped API kullanarak - ücretsiz ve açık kaynak)
RegisterNetEvent('swx_speaker:server:extractYouTubeAudio', function(videoUrl, musicId, volume, distance, coords)
    local src = source
    
    -- Video ID'yi çıkar
    local videoId = string.match(videoUrl, '[?&]v=([^&]+)') or string.match(videoUrl, 'youtu%.be/([^?]+)')
    
    if not videoId then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz YouTube URL!', 'error')
        return
    end
    
    print('[SWX Speaker Server] YouTube audio extract başlatılıyor: ' .. videoId)
    
    -- Alternatif Piped API'leri (biri çalışmazsa diğerini dene)
    local pipedInstances = {
        'https://pipedapi.r4fo.com/streams/',
        'https://pipedapi.adminforge.de/streams/',
        'https://pipedapi.in.projectsegfau.lt/streams/',
        'https://api.piped.yt/streams/'
    }
    
    local function tryNextAPI(index)
        if index > #pipedInstances then
            print('[SWX Speaker Server] HATA: Tüm Piped API\'leri başarısız oldu!')
            TriggerClientEvent('QBCore:Notify', src, 'YouTube API\'leri şu an erişilemez. Lütfen tekrar deneyin!', 'error')
            return
        end
        
        local pipedApiUrl = pipedInstances[index] .. videoId
        print('[SWX Speaker Server] Deniyor: ' .. pipedInstances[index])
        
        PerformHttpRequest(pipedApiUrl, function(statusCode, response, headers)
            if statusCode == 200 and response then
                local success, data = pcall(function() return json.decode(response) end)
                
                if success and data and data.audioStreams and #data.audioStreams > 0 then
                    -- En yüksek kaliteli ses formatını bul (M4A veya WebM)
                    local bestAudio = nil
                    local bestBitrate = 0
                    
                    for _, stream in ipairs(data.audioStreams) do
                        -- M4A formatı tercih et (daha uyumlu)
                        if stream.mimeType and (string.find(stream.mimeType, 'audio/mp4') or string.find(stream.mimeType, 'audio/m4a')) then
                            if stream.bitrate and stream.bitrate > bestBitrate then
                                bestAudio = stream
                                bestBitrate = stream.bitrate
                            end
                        end
                    end
                    
                    -- M4A bulunamadıysa WebM kullan
                    if not bestAudio then
                        for _, stream in ipairs(data.audioStreams) do
                            if stream.mimeType and string.find(stream.mimeType, 'audio/webm') then
                                if stream.bitrate and stream.bitrate > bestBitrate then
                                    bestAudio = stream
                                    bestBitrate = stream.bitrate
                                end
                            end
                        end
                    end
                    
                    if bestAudio and bestAudio.url then
                        local audioUrl = bestAudio.url
                        print('[SWX Speaker Server] Audio URL bulundu: ' .. audioUrl)
                        print('[SWX Speaker Server] Format: ' .. (bestAudio.mimeType or 'unknown') .. ' | Bitrate: ' .. (bestAudio.bitrate or 'unknown'))
                        
                        -- Client'a audio URL'sini gönder
                        TriggerClientEvent('swx_speaker:client:playExtractedAudio', src, audioUrl, musicId, volume, distance, coords, data.title)
                    else
                        print('[SWX Speaker Server] HATA: Audio stream bulunamadı!')
                        TriggerClientEvent('QBCore:Notify', src, 'YouTube sesi çıkarılamadı!', 'error')
                    end
                else
                    print('[SWX Speaker Server] HATA: Audio streams array boş!')
                    TriggerClientEvent('QBCore:Notify', src, 'YouTube format desteklenmiyor!', 'error')
                end
            else
                print('[SWX Speaker Server] HTTP hatası: ' .. statusCode .. ' - Bir sonraki API deneniyor...')
                tryNextAPI(index + 1)
            end
        end, 'GET')
    end
    
    -- İlk API'yi dene
    tryNextAPI(1)
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
