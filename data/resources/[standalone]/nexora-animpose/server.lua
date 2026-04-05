local QBCore = exports['qb-core']:GetCoreObject()

-- Komut kaydı
QBCore.Commands.Add('ap', 'Animasyon pozisyonu düzenle', {}, false, function(source)
    -- Client-side komut olduğu için burada bir şey yapmaya gerek yok
end)

-- Sync event
RegisterNetEvent('nexora-animpose:sync', function(coords, heading, alpha)
    local src = source
    TriggerClientEvent('nexora-animpose:syncClient', -1, src, coords, heading, alpha)
end)
