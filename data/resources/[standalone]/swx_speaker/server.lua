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

-- YouTube Audio Extract (Invidious API + alternatif servisler kullanarak)
RegisterNetEvent('swx_speaker:server:extractYouTubeAudio', function(videoUrl, musicId, volume, distance, coords)
    local src = source
    
    -- Video ID'yi çıkar
    local videoId = string.match(videoUrl, '[?&]v=([^&]+)') or string.match(videoUrl, 'youtu%.be/([^?]+)')
    
    if not videoId then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz YouTube URL!', 'error')
        return
    end
    
    print('[SWX Speaker Server] YouTube audio extract başlatılıyor: ' .. videoId)
    
    -- YTDLP benzeri alternatif servisler (daha güvenilir)
    local extractServices = {
        -- Invidious API (resmi YouTube alternatif arayüzü)
        {
            url = 'https://inv.tux.pizza/api/v1/videos/' .. videoId,
            parse = function(data)
                if data and data.formatStreams then
                    -- Video + audio birleşik stream'leri kontrol et
                    for _, stream in ipairs(data.formatStreams) do
                        if stream.quality == 'tiny' or (stream.audioQuality and string.find(stream.audioQuality, 'AUDIO_QUALITY')) then
                            return stream.url, data.title
                        end
                    end
                    -- İlk stream'i dene
                    if data.formatStreams[1] then
                        return data.formatStreams[1].url, data.title
                    end
                elseif data and data.adaptiveFormats then
                    -- Adaptive formatlardan ses'i bul
                    for _, format in ipairs(data.adaptiveFormats) do
                        if format.mimeType and string.find(format.mimeType, 'audio') then
                            return format.url, data.title
                        end
                    end
                end
                return nil, nil
            end
        },
        -- Alternative Invidious instances
        {
            url = 'https://invidious.fdn.fr/api/v1/videos/' .. videoId,
            parse = function(data)
                if data and data.formatStreams and #data.formatStreams > 0 then
                    return data.formatStreams[1].url, data.title
                elseif data and data.adaptiveFormats then
                    for _, format in ipairs(data.adaptiveFormats) do
                        if format.mimeType and string.find(format.mimeType, 'audio') then
                            return format.url, data.title
                        end
                    end
                end
                return nil, nil
            end
        },
        {
            url = 'https://vid.puffyan.us/api/v1/videos/' .. videoId,
            parse = function(data)
                if data and data.formatStreams and #data.formatStreams > 0 then
                    return data.formatStreams[1].url, data.title
                elseif data and data.adaptiveFormats then
                    for _, format in ipairs(data.adaptiveFormats) do
                        if format.mimeType and string.find(format.mimeType, 'audio') then
                            return format.url, data.title
                        end
                    end
                end
                return nil, nil
            end
        }
    }
    
    local function tryNextService(index)
        if index > #extractServices then
            print('[SWX Speaker Server] HATA: Tüm extract servisleri başarısız oldu!')
            TriggerClientEvent('QBCore:Notify', src, 'YouTube sesi çıkarılamadı. Lütfen direkt MP3 URL kullanın!', 'error')
            return
        end
        
        local service = extractServices[index]
        print('[SWX Speaker Server] Deniyor: ' .. service.url)
        
        PerformHttpRequest(service.url, function(statusCode, response, headers)
            if statusCode == 200 and response then
                local success, data = pcall(function() return json.decode(response) end)
                
                if success and data then
                    local audioUrl, title = service.parse(data)
                    
                    if audioUrl then
                        print('[SWX Speaker Server] Audio URL bulundu!')
                        print('[SWX Speaker Server] Başlık: ' .. (title or 'Bilinmiyor'))
                        
                        -- Client'a audio URL'sini gönder
                        TriggerClientEvent('swx_speaker:client:playExtractedAudio', src, audioUrl, musicId, volume, distance, coords, title)
                    else
                        print('[SWX Speaker Server] HATA: Audio stream bulunamadı!')
                        tryNextService(index + 1)
                    end
                else
                    print('[SWX Speaker Server] JSON parse hatası!')
                    tryNextService(index + 1)
                end
            else
                print('[SWX Speaker Server] HTTP hatası: ' .. statusCode .. ' - Bir sonraki servis deneniyor...')
                tryNextService(index + 1)
            end
        end, 'GET')
    end
    
    -- İlk servisi dene
    tryNextService(1)
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
