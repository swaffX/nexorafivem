local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local isPaused = false 
local currentVolume = Config.DefaultVolume
local currentDistance = Config.MaxDistance
local playlist = {}
local musicHistory = {} 
local isExtracting = false 
local lastVehicle = nil
local activeSounds = {} -- Track all active sounds per vehicle

-- Request tracking
local currentExtractRequest = 0

-- Oyuncu spawn olduğunda geçmişi yükle
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('swx_speaker:server:loadHistory')
end)

-- Geçmişi al
RegisterNetEvent('swx_speaker:client:receiveHistory', function(history)
    musicHistory = {}
    if history then
        for i, song in ipairs(history) do
            table.insert(musicHistory, {
                url = song.url,
                title = song.title or 'Bilinmeyen Şarkı',
                timestamp = song.timestamp
            })
        end
    end
end)

-- Araç plakasına göre benzersiz ID oluştur
function GetVehicleMusicId(vehicle)
    if not vehicle or vehicle == 0 then return nil end
    local plate = GetVehicleNumberPlateText(vehicle)
    if not plate then return nil end
    return "veh_" .. plate:gsub("%s+", "")
end

-- Araç değişimini takip et
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local currentVehicle = GetVehiclePedIsIn(ped, false)
        
        if currentVehicle ~= lastVehicle then
            lastVehicle = currentVehicle
            if currentVehicle ~= 0 then
                local musicId = GetVehicleMusicId(currentVehicle)
                if musicId and exports.xsound:soundExists(musicId) then
                    isPlaying = true
                    isPaused = exports.xsound:isPaused(musicId) or false
                else
                    isPlaying = false
                    isPaused = false
                end
            end
        end
    end
end)

-- State reset fonksiyonu
function ResetState()
    isExtracting = false
    currentExtractRequest = 0
end

-- K tuşu ile menü aç
RegisterCommand('speaker', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    -- State'i senkronize et
    local musicId = GetVehicleMusicId(vehicle)
    if musicId and exports.xsound:soundExists(musicId) then
        isPlaying = true
        isPaused = exports.xsound:isPaused(musicId) or false
    else
        isPlaying = false
        isPaused = false
    end
    OpenSpeakerMenu()
end, false)

RegisterKeyMapping('speaker', 'Hoparlör Etkileşimi', 'keyboard', Config.OpenKey)

-- ANA MENÜ - Hoparlör Ayarları
function OpenSpeakerMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local musicId = GetVehicleMusicId(vehicle)
    local volPercent = math.floor(currentVolume * 100)
    local distText = tostring(math.floor(currentDistance)) .. 'm'

    lib.registerContext({
        id = 'speaker_menu',
        title = 'Hoparlör ayarları',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Sırayı yönet',
                description = 'Çalma listesini yönet',
                icon = 'list',
                arrow = true,
                onSelect = function() PlaylistMenu() end
            },
            {
                title = 'Ses seviyesi ve aralık',
                description = string.format('Ses: %d%% | Mesafe: %s', volPercent, distText),
                icon = 'volume-up',
                arrow = true,
                onSelect = function() VolumeRangeDialog() end
            },
            {
                title = 'Bağlan',
                description = 'Bağlantı ayarları',
                icon = 'link',
                arrow = true
            },
            {
                title = 'Herkese açık durum',
                description = 'Herkese açık durum ayarları',
                icon = 'users',
                arrow = true
            },
            {
                title = 'Kalıcı durum',
                description = 'Kalıcı durum ayarları',
                icon = 'bookmark',
                arrow = true
            },
            {
                title = 'Hoparlörü yeniden adlandır',
                description = 'Hoparlör adını değiştir',
                icon = 'edit',
                arrow = true
            },
            {
                title = '──────────────',
                disabled = true
            },
            {
                title = 'Diğer',
                description = 'Diğer ayarlar',
                icon = 'ellipsis-h',
                arrow = true,
                onSelect = function() OtherSettingsMenu() end
            }
        }
    })
    lib.showContext('speaker_menu')
end

-- DİĞER AYARLAR MENÜSÜ
function OtherSettingsMenu()
    lib.registerContext({
        id = 'other_settings_menu',
        title = 'Diğer ayarlar',
        menu = 'speaker_menu',
        options = {
            {
                title = '🎵 Yeni müzik çal',
                description = isExtracting and '⏳ YouTube sesi işleniyor...' or 'YouTube URL veya direkt MP3 linki girin',
                icon = 'play',
                iconColor = 'green',
                disabled = isExtracting,
                onSelect = function() PlayMusicDialog() end
            },
            {
                title = '📋 Sıraya ekle',
                description = 'Sonraki şarkıyı listeye ekle',
                icon = 'list',
                iconColor = 'blue',
                disabled = isExtracting,
                onSelect = function() AddToQueueDialog() end
            },
            {
                title = isPaused and '▶️ Devam et' or '⏸️ Duraklat',
                description = isPaused and 'Müziği devam ettir' or 'Müziği duraklat',
                icon = isPaused and 'play' or 'pause',
                iconColor = isPaused and 'green' or 'orange',
                disabled = not isPlaying and not isPaused,
                onSelect = function() TogglePause() end
            },
            {
                title = '⏹️ Müziği durdur',
                description = 'Müziği tamamen durdur',
                icon = 'stop',
                iconColor = 'red',
                disabled = not isPlaying,
                onSelect = function()
                    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
                    StopAndClearMusic(musicId)
                end
            },
            {
                title = '──────────────',
                disabled = true
            },
            {
                title = 'Müzik geçmişi',
                description = 'Daha önce çalınan şarkıları gör',
                icon = 'history',
                arrow = true,
                onSelect = function() MusicHistoryMenu() end
            },
            {
                title = 'Filtreler',
                description = 'Filtreleri çıkışa uygula',
                icon = 'sliders',
                arrow = true,
                disabled = not isPlaying,
                onSelect = function() FiltersMenu() end
            }
        }
    })
    lib.showContext('other_settings_menu')
end

-- Müziği durdur ve temizle
function StopAndClearMusic(musicId)
    if musicId and exports.xsound:soundExists(musicId) then
        -- Fade out efekti
        for i = 10, 1, -1 do
            SetTimeout((10-i) * 30, function()
                if exports.xsound:soundExists(musicId) then
                    exports.xsound:setVolume(musicId, currentVolume * (i / 10))
                end
            end)
        end
        
        -- 300ms sonra tamamen durdur
        SetTimeout(350, function()
            if exports.xsound:soundExists(musicId) then
                exports.xsound:Destroy(musicId)
            end
            isPlaying = false
            isPaused = false
            isExtracting = false
            activeSounds[musicId] = nil
            QBCore.Functions.Notify('Müzik durduruldu ve kaynaklar temizlendi', 'error')
        end)
    else
        isPlaying = false
        isPaused = false
        isExtracting = false
        QBCore.Functions.Notify('Aktif müzik bulunamadı', 'info')
    end
end

-- KONUM GÜNCELLEME THREAD - Düzeltilmiş: Kamera değil araç merkezine göre
CreateThread(function()
    while true do
        Wait(50) -- 50ms'de bir güncelle (20fps)
        
        local vehicles = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) then
                local musicId = GetVehicleMusicId(vehicle)
                if musicId and exports.xsound:soundExists(musicId) then
                    -- ARAÇ MERKEZİNİ AL (kamera değil!)
                    local coords = GetEntityCoords(vehicle)
                    local velocity = GetEntityVelocity(vehicle)
                    
                    -- Velocity bazlı tahmin (50ms gecikmeyi telafi et)
                    local predictedCoords = vector3(
                        coords.x + velocity.x * 0.05,
                        coords.y + velocity.y * 0.05,
                        coords.z + velocity.z * 0.05
                    )
                    
                    -- Sadece duyabilecek mesafedeki oyuncular için güncelle
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)
                    local dist = #(playerCoords - coords)
                    
                    -- Dinamik mesafe: Hıza göre ayarla (hızlı araç = daha geniş alan)
                    local dynamicDistance = currentDistance + (GetEntitySpeed(vehicle) * 2)
                    
                    if dist < dynamicDistance then
                        exports.xsound:Position(musicId, predictedCoords)
                    end
                end
            end
        end
    end
end)

-- MÜZİK BAŞLATMA - Geliştirilmiş State Kontrolü
function PlayMusic(url, title)
    -- State kontrolü - eğer işlem devam ediyorsa reddet
    if isExtracting then
        QBCore.Functions.Notify('Halihazırda bir işlem devam ediyor, lütfen bekleyin', 'error')
        return
    end
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    
    local musicId = GetVehicleMusicId(vehicle)
    if not musicId then
        QBCore.Functions.Notify('Araç plakası okunamadı!', 'error')
        return
    end
    
    -- Eski sesi durdur
    if exports.xsound:soundExists(musicId) then
        exports.xsound:Destroy(musicId)
        Wait(100)
    end
    
    local coords = GetEntityCoords(vehicle)
    local isYouTube = string.find(url, 'youtube.com') or string.find(url, 'youtu.be')
    
    if isYouTube then
        isExtracting = true
        currentExtractRequest = currentExtractRequest + 1
        local requestId = currentExtractRequest
        
        -- 25 saniyelik timeout (yeterli süre)
        SetTimeout(25000, function()
            if isExtracting and currentExtractRequest == requestId then
                isExtracting = false
                QBCore.Functions.Notify('⏱️ Zaman aşımı: YouTube yanıt vermedi', 'error')
                print('[SWX Speaker] Timeout - RequestID:', requestId)
            end
        end)
        
        QBCore.Functions.Notify('⏳ YouTube sesi alınıyor...', 'info', 5000)
        TriggerServerEvent('swx_speaker:server:extractYouTubeAudio', url, musicId, currentVolume, currentDistance, coords, requestId)
    else
        isExtracting = false
        StartAudio(musicId, url, currentVolume, coords, currentDistance, title or 'Direkt URL')
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Direkt URL')
    end
end

-- GARANTİLİ BAŞLATMA - Smooth fade-in, no kickback
function StartAudio(musicId, url, volume, coords, distance, title)
    print('[SWX Speaker] StartAudio çağrıldı:', musicId, url:sub(1, 50))
    
    -- URL kontrolü
    if not url or url == '' then
        QBCore.Functions.Notify('Geçersiz ses URL\'si', 'error')
        isPlaying = false
        return
    end
    
    -- Yeni sesi başlat
    local success, err = pcall(function()
        exports.xsound:PlayUrlPos(musicId, url, 0.01, coords, false)
        exports.xsound:Distance(musicId, distance)
        exports.xsound:destroyOnFinish(musicId, false)
    end)
    
    if not success then
        print('[SWX Speaker] XSound Error:', err)
        QBCore.Functions.Notify('Ses başlatma hatası!', 'error')
        isPlaying = false
        return
    end
    
    -- Sesin varlığını kontrol et
    SetTimeout(200, function()
        local exists = exports.xsound:soundExists(musicId)
        print('[SWX Speaker] Ses var mı:', exists)
        if not exists then
            print('[SWX Speaker] SES BAŞLATILAMADI - URL:', url:sub(1, 50))
            QBCore.Functions.Notify('❌ Ses başlatılamadı! URL\'yi kontrol edin.', 'error')
            isPlaying = false
            return
        end
        
        print('[SWX Speaker] Ses başarıyla başlatıldı, fade-in başlıyor')
    end)
    
    isPlaying = true
    isPaused = false
    isExtracting = false
    activeSounds[musicId] = {
        url = url,
        title = title,
        startTime = GetGameTimer()
    }
    
    -- Smooth fade-in (500ms)
    SetTimeout(300, function()
        if exports.xsound:soundExists(musicId) then
            for i = 1, 10 do
                SetTimeout(i * 50, function()
                    if exports.xsound:soundExists(musicId) then
                        local targetVol = math.min(volume, 2.0)
                        exports.xsound:setVolume(musicId, 0.01 + (targetVol - 0.01) * (i / 10))
                    end
                end)
            end
        end
    end)
    
    if title then
        QBCore.Functions.Notify('▶️ ' .. title, 'success')
    end
end

RegisterNetEvent('swx_speaker:client:playExtractedAudio', function(audioUrl, musicId, volume, distance, coords, title, originalUrl, requestId, serverIp)
    print('[SWX Speaker Client] EVENT GELDİ! requestId:', requestId)
    
    -- Eski request'leri ignore et
    if requestId and requestId < currentExtractRequest then
        print('[SWX Speaker] Eski request ignore edildi:', requestId)
        return
    end
    
    isExtracting = false
    
    if not audioUrl or audioUrl == '' then
        QBCore.Functions.Notify('Ses URL\'si alınamadı!', 'error')
        return
    end
    
    -- IP değiştir (localhost -> sunucu IP)
    local targetIp = serverIp or '194.105.5.37'
    audioUrl = audioUrl:gsub('localhost', targetIp)
    audioUrl = audioUrl:gsub('127%.0%.0%.1', targetIp)
    
    print('[SWX Speaker] Audio URL:', audioUrl:sub(1, 60))
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçtan indiniz, ses iptal edildi', 'error')
        return
    end
    
    local currentMusicId = GetVehicleMusicId(vehicle)
    if currentMusicId ~= musicId then
        musicId = currentMusicId
    end
    
    print('[SWX Speaker] Müzik başlatılıyor:', musicId)
    StartAudio(musicId, audioUrl, volume, coords, distance, title or 'YouTube Şarkı')
    TriggerServerEvent('swx_speaker:server:addToHistory', originalUrl or audioUrl, title or 'YouTube Şarkı')
end)

RegisterNetEvent('swx_speaker:client:extractFailed', function(requestId)
    if requestId and requestId < currentExtractRequest then return end
    isExtracting = false
    QBCore.Functions.Notify('❌ Ses alınamadı, tekrar deneyin', 'error')
end)

-- DİALOGLAR VE MENÜLER - Geliştirilmiş
function PlayMusicDialog()
    local input = lib.inputDialog('🎵 Yeni Müzik Çal', {
        { 
            type = 'input', 
            label = 'YouTube veya Direkt URL', 
            description = 'Örnek: https://www.youtube.com/watch?v=...',
            required = true, 
            icon = 'link',
            placeholder = 'https://...'
        }
    })
    if input and input[1] and input[1] ~= '' then
        PlayMusic(input[1], nil)
    else
        QBCore.Functions.Notify('Geçersiz URL', 'error')
    end
end

function AddToQueueDialog()
    local input = lib.inputDialog('📋 Sıraya Ekle', {
        { 
            type = 'input', 
            label = 'YouTube veya Direkt URL', 
            description = 'Sıradaki şarkıyı ekle',
            required = true, 
            icon = 'link',
            placeholder = 'https://...'
        }
    })
    if input and input[1] and input[1] ~= '' then
        isExtracting = true
        QBCore.Functions.Notify('⏳ Şarkı bilgisi alınıyor...', 'info', 3000)
        
        QBCore.Functions.TriggerCallback('swx_speaker:getYouTubeTitle', function(title)
            isExtracting = false
            if title then
                table.insert(playlist, { url = input[1], title = title })
                QBCore.Functions.Notify('✅ "' .. title .. '" sıraya eklendi', 'success')
            else
                table.insert(playlist, { url = input[1], title = 'Bilinmeyen Şarkı' })
                QBCore.Functions.Notify('✅ Şarkı sıraya eklendi', 'success')
            end
        end, input[1])
    end
end

function PlaylistMenu()
    local options = {
        {
            title = '▶️ Sıradaki Şarkıya Geç',
            description = 'Bir sonraki şarkıyı çal',
            icon = 'forward',
            iconColor = 'green',
            disabled = #playlist == 0,
            onSelect = function() PlayNextSong() end
        },
        {
            title = '🔄 Sırayı Karıştır',
            description = 'Playlist\'i rastgele sıraya diz',
            icon = 'random',
            iconColor = 'purple',
            disabled = #playlist < 2,
            onSelect = function() 
                for i = #playlist, 2, -1 do
                    local j = math.random(i)
                    playlist[i], playlist[j] = playlist[j], playlist[i]
                end
                QBCore.Functions.Notify('🔀 Sıra karıştırıldı', 'success')
                PlaylistMenu()
            end
        },
        {
            title = '🗑️ Tüm Sırayı Temizle',
            description = 'Tüm bekleyen şarkıları sil',
            icon = 'trash',
            iconColor = 'red',
            disabled = #playlist == 0,
            onSelect = function() 
                playlist = {} 
                QBCore.Functions.Notify('🗑️ Sıra temizlendi', 'info')
            end
        },
        { title = '──────────────', disabled = true }
    }
    
    for i, song in ipairs(playlist) do
        table.insert(options, { 
            title = i .. '. ' .. song.title, 
            description = '▶️ Çalmak için tıkla',
            icon = 'music',
            onSelect = function() 
                PlayMusic(song.url, song.title) 
                table.remove(playlist, i)
            end
        })
    end
    
    lib.registerContext({
        id = 'playlist_menu',
        title = 'Sırayı yönet',
        menu = 'speaker_menu',
        options = options
    })
    lib.showContext('playlist_menu')
end

function MusicHistoryMenu()
    TriggerServerEvent('swx_speaker:server:loadHistory')
    Wait(400)
    
    local options = {}
    if #musicHistory == 0 then
        table.insert(options, { 
            title = '📭 Geçmiş boş', 
            description = 'Henüz çalınan şarkı kaydı yok',
            disabled = true 
        })
    else
        table.insert(options, {
            title = '🗑️ Tüm Geçmişi Temizle',
            icon = 'trash',
            iconColor = 'red',
            onSelect = function()
                TriggerServerEvent('swx_speaker:server:clearHistory')
                musicHistory = {}
                QBCore.Functions.Notify('🗑️ Geçmiş temizlendi', 'info')
            end
        })
        table.insert(options, { title = '──────────────', disabled = true })
        
        for i, song in ipairs(musicHistory) do
            local dateStr = ''
            if song.timestamp then
                local date = os.date('*t', song.timestamp)
                dateStr = string.format('%02d.%02d %02d:%02d', date.day, date.month, date.hour, date.min)
            end
            
            table.insert(options, {
                title = song.title,
                description = '📅 ' .. dateStr,
                icon = 'history',
                arrow = true,
                onSelect = function() SongActionMenu(song) end
            })
        end
    end
    
    lib.registerContext({
        id = 'history_menu',
        title = 'Müzik geçmişi',
        menu = 'other_settings_menu',
        options = options
    })
    lib.showContext('history_menu')
end

-- ŞARKI EYLEM MENÜSÜ
function SongActionMenu(song)
    lib.registerContext({
        id = 'song_action_menu',
        title = song.title,
        menu = 'history_menu',
        options = {
            {
                title = '▶️ Çal',
                description = 'Şarkıyı hemen çal',
                icon = 'play',
                iconColor = 'green',
                onSelect = function() PlayMusic(song.url, song.title) end
            },
            {
                title = '📋 Sıraya ekle',
                description = 'Şarkıyı sıraya ekle',
                icon = 'list',
                iconColor = 'blue',
                onSelect = function()
                    table.insert(playlist, { url = song.url, title = song.title })
                    QBCore.Functions.Notify('📋 ' .. song.title .. ' sıraya eklendi', 'success')
                end
            },
            {
                title = '🗑️ Geçmişten sil',
                description = 'Şarkıyı geçmişten kaldır',
                icon = 'trash',
                iconColor = 'red',
                onSelect = function()
                    for i, s in ipairs(musicHistory) do
                        if s.url == song.url then
                            table.remove(musicHistory, i)
                            break
                        end
                    end
                    TriggerServerEvent('swx_speaker:server:updateHistory', musicHistory)
                    QBCore.Functions.Notify('🗑️ Şarkı geçmişten silindi', 'info')
                    MusicHistoryMenu()
                end
            }
        }
    })
    lib.showContext('song_action_menu')
end

-- SES FİLTRELERİ MENÜSÜ
function FiltersMenu()
    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
    if not musicId or not exports.xsound:soundExists(musicId) then
        QBCore.Functions.Notify('Aktif müzik bulunamadı!', 'error')
        return
    end

    lib.registerContext({
        id = 'filters_menu',
        title = 'Filtreler',
        menu = 'other_settings_menu',
        options = {
            {
                title = '🔊 Subwoofer Modu',
                description = 'Maximum bass - sadece düşük frekanslar (20-80Hz)',
                icon = 'speaker',
                iconColor = 'darkred',
                onSelect = function() FilterConfirmMenu(musicId, 'subwoofer', 'Subwoofer Modu', 'Maximum bass - sadece düşük frekanslar (20-80Hz)') end
            },
            {
                title = '🎵 Lowshelf Bass Boost',
                description = 'Düşük frekansları artır (+20dB @ 100Hz)',
                icon = 'arrow-up',
                iconColor = 'red',
                onSelect = function() FilterConfirmMenu(musicId, 'lowshelf_boost', 'Lowshelf Bass Boost', 'Düşük frekansları artır (+20dB @ 100Hz)') end
            },
            {
                title = '📉 Lowshelf Bass Cut',
                description = 'Düşük frekansları kes (-15dB @ 200Hz)',
                icon = 'arrow-down',
                iconColor = 'orange',
                onSelect = function() FilterConfirmMenu(musicId, 'lowshelf_cut', 'Lowshelf Bass Cut', 'Düşük frekansları kes (-15dB @ 200Hz)') end
            },
            {
                title = '🎸 Highshelf Treble Boost',
                description = 'Yüksek frekansları artır (+15dB @ 8000Hz)',
                icon = 'music',
                iconColor = 'yellow',
                onSelect = function() FilterConfirmMenu(musicId, 'highshelf_boost', 'Highshelf Treble Boost', 'Yüksek frekansları artır (+15dB @ 8000Hz)') end
            },
            {
                title = '📉 Highshelf Treble Cut',
                description = 'Yüksek frekansları kes (-15dB @ 6000Hz)',
                icon = 'volume-mute',
                iconColor = 'grey',
                onSelect = function() FilterConfirmMenu(musicId, 'highshelf_cut', 'Highshelf Treble Cut', 'Yüksek frekansları kes (-15dB @ 6000Hz)') end
            },
            {
                title = '🎼 Lowpass Filter',
                description = 'Sadece bas frekansları bırak (400Hz altı)',
                icon = 'filter',
                iconColor = 'blue',
                onSelect = function() FilterConfirmMenu(musicId, 'lowpass', 'Lowpass Filter', 'Sadece bas frekansları bırak (400Hz altı)') end
            },
            {
                title = '📢 Highpass Filter',
                description = 'Sadece tiz frekansları bırak (1000Hz üstü)',
                icon = 'broadcast-tower',
                iconColor = 'purple',
                onSelect = function() FilterConfirmMenu(musicId, 'highpass', 'Highpass Filter', 'Sadece tiz frekansları bırak (1000Hz üstü)') end
            },
            {
                title = '🎯 Peaking EQ',
                description = 'Orta frekansları ayarla (1000Hz)',
                icon = 'adjust',
                iconColor = 'cyan',
                onSelect = function() FilterConfirmMenu(musicId, 'peaking', 'Peaking EQ', 'Orta frekansları ayarla (1000Hz)') end
            },
            {
                title = '🎧 Telefon/Radyo Efekti',
                description = 'Dar bant filtre (300-3400Hz)',
                icon = 'phone',
                iconColor = 'green',
                onSelect = function() FilterConfirmMenu(musicId, 'telephone', 'Telefon/Radyo Efekti', 'Dar bant filtre (300-3400Hz)') end
            },
            {
                title = '🎹 Vokal Booster',
                description = 'Vokal frekanslarını artır (2500Hz)',
                icon = 'microphone',
                iconColor = 'pink',
                onSelect = function() FilterConfirmMenu(musicId, 'vocal', 'Vokal Booster', 'Vokal frekanslarını artır (2500Hz)') end
            },
            {
                title = '──────────────',
                disabled = true
            },
            {
                title = '➕ Yeni filtre',
                description = 'Özel filtre oluştur',
                icon = 'plus',
                iconColor = 'green',
                onSelect = function() CustomFilterDialog(musicId) end
            },
            {
                title = '──────────────',
                disabled = true
            },
            {
                title = '🔄 Filtreleri sıfırla',
                description = 'Tüm efektleri kaldır',
                icon = 'undo',
                iconColor = 'grey',
                onSelect = function()
                    ApplyFilter(musicId, 'reset')
                    QBCore.Functions.Notify('🔄 Filtreler sıfırlandı', 'info')
                end
            }
        }
    })
    lib.showContext('filters_menu')
end

-- FİLTRE ONAYLAMA MENÜSÜ
function FilterConfirmMenu(musicId, filterType, filterName, filterDesc)
    lib.registerContext({
        id = 'filter_confirm_menu',
        title = filterName,
        menu = 'filters_menu',
        options = {
            {
                title = 'Açıklama',
                description = filterDesc,
                icon = 'info',
                disabled = true
            },
            {
                title = '──────────────',
                disabled = true
            },
            {
                title = '✅ Onayla',
                description = 'Filtreyi uygula',
                icon = 'check',
                iconColor = 'green',
                onSelect = function()
                    ApplyFilter(musicId, filterType)
                    QBCore.Functions.Notify('✅ ' .. filterName .. ' aktif', 'success')
                end
            },
            {
                title = '❌ İptal',
                description = 'Filtre menüsüne dön',
                icon = 'times',
                iconColor = 'red',
                onSelect = function() FiltersMenu() end
            }
        }
    })
    lib.showContext('filter_confirm_menu')
end

-- ÖZEL FİLTRE DIALOG - Frequency, Gain, Detune
function CustomFilterDialog(musicId)
    if not exports.xsound:soundExists(musicId) then
        QBCore.Functions.Notify('Aktif müzik bulunamadı!', 'error')
        return
    end

    local input = lib.inputDialog('Filtre değerleri', {
        {
            type = 'slider',
            label = 'Frequency',
            description = '10 ile 10000 arasında Hz',
            default = 350,
            min = 10,
            max = 10000
        },
        {
            type = 'slider',
            label = 'Gain',
            description = '-40 ile 40 arasında dB',
            default = 0,
            min = -40,
            max = 40
        },
        {
            type = 'slider',
            label = 'Detune',
            description = '-4800 ile 4800 arasında cents',
            default = 0,
            min = -4800,
            max = 4800
        }
    })

    if input then
        local frequency = input[1]
        local gain = input[2]
        local detune = input[3]

        print('[SWX Speaker] Özel filtre uygulanıyor:', frequency, gain, detune)

        local success, err = pcall(function()
            exports.xsound:setFilter(musicId, 'peaking', frequency, 1.0, gain)
        end)

        if not success then
            print('[SWX Speaker] XSound setFilter hatası:', err)
            QBCore.Functions.Notify('⚠️ Filtre uygulanamadı!', 'error')
        else
            QBCore.Functions.Notify(string.format('✅ Filtre uygulandı: %dHz, %ddB, %d cents', frequency, gain, detune), 'success')
        end
    end
end

function ApplyFilter(musicId, filterType, value)
    if not exports.xsound:soundExists(musicId) then 
        print('[SWX Speaker] Filtre uygulanamadı - ses yok')
        return 
    end
    
    print('[SWX Speaker] Filtre uygulanıyor:', filterType, 'musicId:', musicId)
    
    local filterData = nil
    
    if filterType == 'reset' then
        filterData = false
    elseif filterType == 'subwoofer' then
        filterData = {
            type = 'lowshelf',
            frequency = 80,
            gain = 25,
            Q = 0.7
        }
    elseif filterType == 'lowshelf_boost' then
        filterData = {
            type = 'lowshelf',
            frequency = 100,
            gain = 20,
            Q = 1.0
        }
    elseif filterType == 'lowshelf_cut' then
        filterData = {
            type = 'lowshelf',
            frequency = 200,
            gain = -15,
            Q = 1.0
        }
    elseif filterType == 'highshelf_boost' then
        filterData = {
            type = 'highshelf',
            frequency = 8000,
            gain = 15,
            Q = 1.0
        }
    elseif filterType == 'highshelf_cut' then
        filterData = {
            type = 'highshelf',
            frequency = 6000,
            gain = -15,
            Q = 1.0
        }
    elseif filterType == 'lowpass' then
        filterData = {
            type = 'lowpass',
            frequency = 400,
            Q = 1.0
        }
    elseif filterType == 'highpass' then
        filterData = {
            type = 'highpass',
            frequency = 1000,
            Q = 1.0
        }
    elseif filterType == 'peaking' then
        filterData = {
            type = 'peaking',
            frequency = 1000,
            gain = 10,
            Q = 1.5
        }
    elseif filterType == 'telephone' then
        filterData = {
            type = 'bandpass',
            frequency = 1850,
            Q = 0.5
        }
    elseif filterType == 'vocal' then
        filterData = {
            type = 'peaking',
            frequency = 2500,
            gain = 10,
            Q = 2.0
        }
    end
    
    if filterType == 'reset' then
        exports.xsound:clearAllFilters(musicId)
        print('[SWX Speaker] Filtreler sıfırlandı')
        return
    end
    
    if filterData ~= nil then
        print('[SWX Speaker] Filtre uygulanıyor:', filterType, 'type:', filterData.type, 'freq:', filterData.frequency, 'gain:', filterData.gain, 'Q:', filterData.Q)
        
        local success, err = pcall(function()
            exports.xsound:setFilter(musicId, filterData.type, filterData.frequency, filterData.Q, filterData.gain or 0)
        end)
        
        if not success then
            print('[SWX Speaker] XSound setFilter hatası:', err)
            QBCore.Functions.Notify('⚠️ Filtre uygulanamadı! XSound versiyonunu kontrol edin.', 'error')
        else
            print('[SWX Speaker] Filtre başarıyla uygulandı:', filterType)
        end
    end
end

function CustomEQDialog(musicId)
    if not exports.xsound:soundExists(musicId) then
        QBCore.Functions.Notify('Aktif müzik bulunamadı!', 'error')
        return
    end
    
    local input = lib.inputDialog('⚡ Özel EQ Ayarları', {
        {
            type = 'slider',
            label = 'Low (Bass) Gain',
            description = '100 = Normal, 50 = Azalt, 150 = Artır',
            default = 100,
            min = 0,
            max = 200
        },
        {
            type = 'slider',
            label = 'Mid Gain',
            description = '100 = Normal, 50 = Azalt, 150 = Artır',
            default = 100,
            min = 0,
            max = 200
        },
        {
            type = 'slider',
            label = 'High (Treble) Gain',
            description = '100 = Normal, 50 = Azalt, 150 = Artır',
            default = 100,
            min = 0,
            max = 200
        }
    })
    
    if input then
        local lowGain = (input[1] - 100) / 2
        local midGain = (input[2] - 100) / 2
        local highGain = (input[3] - 100) / 2
        
        pcall(function()
            exports.xsound:setFilter(musicId, {
                type = 'peaking',
                frequency = 100,
                gain = lowGain,
                Q = 1.0
            })
        end)
        
        QBCore.Functions.Notify(string.format('⚡ EQ: Low %d%%, Mid %d%%, High %d%%', input[1], input[2], input[3]), 'success')
    end
end

-- SES AYARLARI - Düzeltilmiş: 0.01 - 2.0 (1% - 200%)
function VolumeRangeDialog()
    local currentVolPercent = math.floor(currentVolume * 100)
    local currentDist = math.floor(currentDistance)
    
    local input = lib.inputDialog('🔊 Ses ve Mesafe Ayarları', {
        { 
            type = 'slider', 
            label = 'Ses Seviyesi (%)', 
            description = '100 = Normal, 150 = %50 daha yüksek, 200 = Maksimum',
            default = currentVolPercent, 
            min = 1, 
            max = 200 
        },
        { 
            type = 'slider', 
            label = 'Duyulma Mesafesi (metre)', 
            description = 'Sesin duyulacaği maksimum mesafe',
            default = currentDist, 
            min = 5, 
            max = 150 
        }
    })
    
    if input then
        currentVolume = input[1] / 100
        currentDistance = input[2]
        
        local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
        if musicId and exports.xsound:soundExists(musicId) then
            exports.xsound:setVolume(musicId, currentVolume)
            exports.xsound:Distance(musicId, currentDistance)
            QBCore.Functions.Notify('🔊 Ses: %' .. input[1] .. ' | Mesafe: ' .. input[2] .. 'm', 'success')
        else
            QBCore.Functions.Notify('⚙️ Ayarlar kaydedildi (müzik çalmıyor)', 'info')
        end
    end
end

function TogglePause()
    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
    if not musicId or not exports.xsound:soundExists(musicId) then
        QBCore.Functions.Notify('Aktif müzik bulunamadı!', 'error')
        isPlaying = false
        isPaused = false
        return
    end
    
    if isPaused then
        exports.xsound:Resume(musicId)
        isPaused = false
        isPlaying = true
        QBCore.Functions.Notify('▶️ Müzik devam ediyor', 'success')
    else
        exports.xsound:Pause(musicId)
        isPaused = true
        isPlaying = true
        QBCore.Functions.Notify('⏸️ Müzik duraklatıldı', 'info')
    end
end

function PlayNextSong()
    if #playlist > 0 then
        local song = table.remove(playlist, 1)
        PlayMusic(song.url, song.title)
        QBCore.Functions.Notify('▶️ Sıradaki: ' .. song.title, 'success')
    else
        QBCore.Functions.Notify('📋 Playlist bitti', 'info')
        isPlaying = false
    end
end

-- Otomatik sonraki şarkıya geç - isFinished olmadığı için zaman bazlı kontrol
CreateThread(function()
    while true do
        Wait(2000) -- 2 saniyede bir kontrol et
        for musicId, soundData in pairs(activeSounds) do
            if exports.xsound:soundExists(musicId) then
                -- Ses hala var mı kontrol et (zaman bazlı)
                local elapsed = GetGameTimer() - soundData.startTime
                -- Eğer ses 30 saniyeden uzun süredir çalıyorsa ve bitmişse
                -- (xsound isFinished yok, bu yüzden sadece varlık kontrolü)
                if elapsed > 30000 and not exports.xsound:isPlaying(musicId) then
                    print('[SWX Speaker] Şarkı bitti (tahmini):', soundData.title)
                    activeSounds[musicId] = nil
                    isPlaying = false
                    if #playlist > 0 then
                        SetTimeout(500, function()
                            PlayNextSong()
                        end)
                    end
                end
            else
                activeSounds[musicId] = nil
                isPlaying = false
            end
        end
    end
end)

-- Komut ile durum sıfırlama (acil durum)
RegisterCommand('speakerfix', function()
    isExtracting = false
    isPlaying = false
    isPaused = false
    currentExtractRequest = 0
    playlist = {}
    
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        local musicId = GetVehicleMusicId(vehicle)
        if musicId and exports.xsound:soundExists(musicId) then
            exports.xsound:Destroy(musicId)
        end
    end
    activeSounds = {}
    
    QBCore.Functions.Notify('✅ Speaker state sıfırlandı', 'success')
    print('[SWX Speaker] State manuel olarak sıfırlandı')
end, false)
