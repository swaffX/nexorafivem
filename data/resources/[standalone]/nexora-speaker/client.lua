local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local currentVolume = Config.DefaultVolume
local currentBass = Config.DefaultBass
local playlist = {}
local currentIndex = 0

-- K tuşu ile menü aç
RegisterCommand('speaker', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    
    local seat = GetPedInVehicleSeat(vehicle, -1)
    if seat ~= ped then
        QBCore.Functions.Notify('Sürücü koltuğunda değilsin!', 'error')
        return
    end
    
    OpenSpeakerMenu()
end, false)

RegisterKeyMapping('speaker', 'Hoparlör Etkileşimi', 'keyboard', Config.OpenKey)

function OpenSpeakerMenu()
    lib.registerContext({
        id = 'speaker_menu',
        title = 'Hoparlör etkileşimi',
        options = {
            {
                title = 'Müzik çal',
                description = 'Youtube videoları ve çalma listeleri destekleniyor.',
                icon = 'play',
                onSelect = function()
                    PlayMusicDialog()
                end
            },
            {
                title = 'Müzik sıraya al',
                description = 'Bir şarkıyı sıraya ekle.',
                icon = 'list',
                onSelect = function()
                    AddToQueueDialog()
                end
            },
            {
                title = 'Sonraki şarkı',
                description = 'Sıradaki sonraki şarkıyı çal.',
                icon = 'forward',
                disabled = #playlist == 0,
                onSelect = function()
                    PlayNextSong()
                end
            },
            {
                title = 'Müziği duraklat/yeniden başlat',
                description = 'Mevcut şarkıyı duraklat ya da yeniden başlat.',
                icon = 'pause',
                disabled = not isPlaying,
                onSelect = function()
                    TogglePause()
                end
            },
            {
                title = 'Ses seviyesini/aralığını değiştir',
                description = 'Müzik sesini veya aralığını ayarla.',
                icon = 'volume-up',
                onSelect = function()
                    VolumeMenu()
                end
            },
            {
                title = 'Hoparlörü tut',
                description = 'Hoparlörü taşı.',
                icon = 'hand',
                onSelect = function()
                    QBCore.Functions.Notify('Taşınabilir hoparlör özelliği yakında!', 'info')
                end
            },
            {
                title = 'Hoparlörü yerden al',
                description = 'Hoparlörü yerden al.',
                icon = 'trash',
                onSelect = function()
                    QBCore.Functions.Notify('Taşınabilir hoparlör özelliği yakında!', 'info')
                end
            },
            {
                title = 'Diğer',
                description = 'Siren, geçmişi ve diğerlerini yönet.',
                icon = 'cog',
                onSelect = function()
                    OtherMenu()
                end
            }
        }
    })
    
    lib.showContext('speaker_menu')
end

function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        {
            type = 'input',
            label = 'YouTube URL',
            description = 'YouTube video veya playlist URL\'si girin',
            required = true,
            icon = 'link'
        }
    })
    
    if input then
        local url = input[1]
        PlayMusic(url)
    end
end

function AddToQueueDialog()
    local input = lib.inputDialog('Sıraya Ekle', {
        {
            type = 'input',
            label = 'YouTube URL',
            description = 'Sıraya eklenecek şarkı URL\'si',
            required = true,
            icon = 'link'
        },
        {
            type = 'input',
            label = 'Şarkı Adı (Opsiyonel)',
            description = 'Şarkı adını girin',
            icon = 'music'
        }
    })
    
    if input then
        table.insert(playlist, {
            url = input[1],
            title = input[2] or 'Bilinmeyen Şarkı'
        })
        QBCore.Functions.Notify('Şarkı sıraya eklendi! (' .. #playlist .. ' şarkı)', 'success')
    end
end

function PlayMusic(url)
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
    end
    
    currentMusicId = "speaker_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        local coords = GetEntityCoords(vehicle)
        
        exports.xsound:PlayUrlPos(currentMusicId, url, currentVolume, coords, false)
        exports.xsound:Distance(currentMusicId, Config.MaxDistance)
        
        if currentBass ~= 0 then
            exports.xsound:setBassGain(currentMusicId, currentBass / 10)
        end
        
        isPlaying = true
        
        CreateThread(function()
            while isPlaying and DoesEntityExist(vehicle) do
                local newCoords = GetEntityCoords(vehicle)
                exports.xsound:Position(currentMusicId, newCoords)
                Wait(500)
            end
        end)
        
        QBCore.Functions.Notify('Müzik çalıyor!', 'success')
    end
end

function PlayNextSong()
    if #playlist == 0 then
        QBCore.Functions.Notify('Playlist boş!', 'error')
        return
    end
    
    currentIndex = currentIndex + 1
    if currentIndex > #playlist then
        currentIndex = 1
    end
    
    local song = playlist[currentIndex]
    PlayMusic(song.url)
    QBCore.Functions.Notify('Çalıyor: ' .. song.title, 'info')
end

function TogglePause()
    if not currentMusicId then return end
    
    if isPlaying then
        exports.xsound:Pause(currentMusicId)
        isPlaying = false
        QBCore.Functions.Notify('Müzik duraklatıldı', 'info')
    else
        exports.xsound:Resume(currentMusicId)
        isPlaying = true
        QBCore.Functions.Notify('Müzik devam ediyor', 'success')
    end
end

function VolumeMenu()
    lib.registerContext({
        id = 'volume_menu',
        title = 'Ses Ayarları',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Ses Seviyesi: ' .. math.floor(currentVolume * 100) .. '%',
                description = 'Ses seviyesini ayarla',
                icon = 'volume-up',
                onSelect = function()
                    VolumeDialog()
                end
            },
            {
                title = 'Bass: ' .. currentBass,
                description = 'Bass seviyesini ayarla (-10 ile +10)',
                icon = 'drum',
                onSelect = function()
                    BassDialog()
                end
            },
            {
                title = 'Mesafe: ' .. Config.MaxDistance .. 'm',
                description = 'Ses duyulma mesafesini ayarla',
                icon = 'ruler',
                onSelect = function()
                    DistanceDialog()
                end
            }
        }
    })
    
    lib.showContext('volume_menu')
end

function VolumeDialog()
    local input = lib.inputDialog('Ses Seviyesi', {
        {
            type = 'slider',
            label = 'Ses Seviyesi',
            min = 0,
            max = 100,
            default = math.floor(currentVolume * 100),
            required = true
        }
    })
    
    if input then
        currentVolume = input[1] / 100
        if currentMusicId then
            exports.xsound:setVolume(currentMusicId, currentVolume)
        end
        QBCore.Functions.Notify('Ses seviyesi: ' .. input[1] .. '%', 'success')
    end
end

function BassDialog()
    local input = lib.inputDialog('Bass Ayarı', {
        {
            type = 'slider',
            label = 'Bass',
            min = -10,
            max = 10,
            default = currentBass,
            required = true
        }
    })
    
    if input then
        currentBass = input[1]
        if currentMusicId then
            exports.xsound:setBassGain(currentMusicId, currentBass / 10)
        end
        QBCore.Functions.Notify('Bass: ' .. currentBass, 'success')
    end
end

function DistanceDialog()
    local input = lib.inputDialog('Mesafe Ayarı', {
        {
            type = 'number',
            label = 'Mesafe (metre)',
            description = 'Ses duyulma mesafesi',
            min = 5,
            max = 100,
            default = Config.MaxDistance,
            required = true
        }
    })
    
    if input then
        Config.MaxDistance = input[1]
        if currentMusicId then
            exports.xsound:Distance(currentMusicId, Config.MaxDistance)
        end
        QBCore.Functions.Notify('Mesafe: ' .. Config.MaxDistance .. 'm', 'success')
    end
end

function OtherMenu()
    lib.registerContext({
        id = 'other_menu',
        title = 'Diğer Ayarlar',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Müziği Durdur',
                description = 'Müziği tamamen durdur',
                icon = 'stop',
                onSelect = function()
                    if currentMusicId then
                        exports.xsound:Destroy(currentMusicId)
                        currentMusicId = nil
                        isPlaying = false
                        QBCore.Functions.Notify('Müzik durduruldu', 'error')
                    end
                end
            },
            {
                title = 'Playlist\'i Temizle',
                description = 'Tüm sırayı temizle',
                icon = 'trash',
                onSelect = function()
                    playlist = {}
                    currentIndex = 0
                    QBCore.Functions.Notify('Playlist temizlendi', 'info')
                end
            },
            {
                title = 'Playlist\'i Göster',
                description = 'Sıradaki şarkıları göster',
                icon = 'list',
                onSelect = function()
                    ShowPlaylist()
                end
            }
        }
    })
    
    lib.showContext('other_menu')
end

function ShowPlaylist()
    if #playlist == 0 then
        QBCore.Functions.Notify('Playlist boş!', 'error')
        return
    end
    
    local options = {}
    for i, song in ipairs(playlist) do
        table.insert(options, {
            title = song.title,
            description = 'Şarkı #' .. i,
            icon = 'music',
            onSelect = function()
                currentIndex = i
                PlayMusic(song.url)
            end
        })
    end
    
    lib.registerContext({
        id = 'playlist_menu',
        title = 'Playlist (' .. #playlist .. ' şarkı)',
        menu = 'other_menu',
        options = options
    })
    
    lib.showContext('playlist_menu')
end

-- Araçtan inince durdur
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        Wait(1000)
        
        if isPlaying then
            local ped = PlayerPedId()
            local inVehicle = IsPedInAnyVehicle(ped, false)
            
            if wasInVehicle and not inVehicle then
                if currentMusicId then
                    exports.xsound:Destroy(currentMusicId)
                    currentMusicId = nil
                    isPlaying = false
                end
            end
            
            wasInVehicle = inVehicle
        end
    end
end)
