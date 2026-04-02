local properties = nil

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    Wait(1000)
    SendNUIMessage({
        action = 'SET_STYLE',
        data = Config.Style
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SendNUIMessage({
        action = 'SET_STYLE',
        data = Config.Style
    })
end)

RegisterNUICallback('buttonSubmit', function(data, cb)
    SetNuiFocus(false)
    properties:resolve(data.data)
    properties = nil
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(_, cb)
    SetNuiFocus(false)
    properties:resolve(nil)
    properties = nil
    cb('ok')
end)

local function ShowInput(data)
    Wait(150)
    if not data then return end
    if properties then return end

    properties = promise.new()

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = data
    })

    return Citizen.Await(properties)
end

exports('ShowInput', ShowInput)


RegisterCommand('testinput', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "QB Input Demo",
        submitText = "Gönder",
        inputs = {
            {
                type = 'text',
                name = 'text_input',
                text = 'Metin Kutusu',
                placeholder = 'Metin girin...'
            },
            {
                type = 'number',
                name = 'number_input',
                text = 'Sayı Kutusu',
                placeholder = 'Sayı girin...'
            },
            {
                type = 'password',
                name = 'password_input',
                text = 'Şifre Kutusu',
                placeholder = 'Şifre girin...'
            },
            {
                type = 'checkbox',
                name = 'checkbox_input',
                text = 'Kabul ediyor musun?',
                options = {
                    { value = "evet", text = "Evet", checked = false },
                    { value = "hayir", text = "Hayır", checked = false }
                }
            },
            {
                type = 'select',
                name = 'select_input',
                text = 'Bir renk seçin',
                options = {
                    { value = "kirmizi", text = "Kırmızı" },
                    { value = "mavi", text = "Mavi" },
                    { value = "yesil", text = "Yeşil" }
                }
            }
        }
    })

    if dialog then
        print("Kullanıcı girdileri:")
        for k, v in pairs(dialog) do
            print(k, v)
        end
    end
end)
