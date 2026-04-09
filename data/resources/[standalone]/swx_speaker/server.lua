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

-- Müzik çalmayı yakındaki oyunculara bildir (xSound isNetworked desteği için)
RegisterNetEvent('swx_speaker:server:playMusic', function(url, title, vehicleNetId, coords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Yakındaki tüm oyunculara müzik bilgisini gönder
    -- Bu event xSound'un isNetworked özelliğini desteklemek için
    TriggerClientEvent('swx_speaker:client:syncMusic', -1, {
        playerId = src,
        url = url,
        title = title,
        vehicleNetId = vehicleNetId,
        coords = coords,
        volume = 0.6,
        maxDistance = 60.0
    })
    
    print(string.format('[SWX Speaker Server] Müzik senkronize edildi: Player=%s, Title=%s', src, title or 'Bilinmeyen'))
end)

-- Müzik durdurmayı bildir
RegisterNetEvent('swx_speaker:server:stopMusic', function()
    local src = source
    TriggerClientEvent('swx_speaker:client:stopMusic', -1, {
        playerId = src
    })
end)
