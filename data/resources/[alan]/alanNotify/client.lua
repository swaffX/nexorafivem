local function openGui(text,type,length)
    guiEnabled = true
    SendNUIMessage({runProgress = true, colorsent = type, textsent = text, fadesent = length})
end
exports('sendnotify', openGui)

function closeGui()
    guiEnabled = false
    SendNUIMessage({closeProgress = true})
end
exports('closenotify', closeGui)



local function Notify(text, texttype, length)
    if type(text) == "table" then
        texttype = texttype == "info" and "primary" or tip == "warn" and "primary" or texttype
        local caption = text.caption or 'Placeholder'
        texttype = texttype or 'primary'
        length = length or 5000
        SendNUIMessage({
            action = 'notify',
            type = texttype,
            length = length,
            text = ttext,
            caption = caption
        })
    else
        texttype = texttype == "info" and "primary" or tip == "warn" and "primary" or texttype
        SendNUIMessage({
            action = 'notify',
            type = texttype,
            length = length,
            text = text
        })
    end
end


local notifId = 0
function SendAlert(yazi,tip,sure)
    -- texttype = texttype == "info" and "primary" or tip == "warn" and "primary" or texttype
    --     if length == nil then
    --         length = 7500
    --     end
    --     notifId = notifId + 1
    --     Notify(yazi, tip, sure)
    if type(text) == "table" then 
        local ttext = text.text or 'Placeholder' 
        local caption = text.caption or 'Placeholder' texttype = texttype or 'primary' length = length or 5000 
        openGui(yazi, tip, sure)
    else 
        texttype = texttype or 'primary' length = length or 5000 
        openGui(yazi, tip, sure)  
    end
end

RegisterCommand("notif", function()
    texttype = texttype == "info" and "primary" or tip == "warn" and "primary" or texttype
        if length == nil then
            length = 7500
        end
        notifId = notifId + 1
        SendAlert("selamlar hocam bu error", "error", 5000) 
        SendAlert("Selamlar hocam bu warning", "warning", 5000)
        SendAlert("Selamlar hocam bu primary", "primary", 5000)
        SendAlert("Selamlar hocam bu success", "success", 5000)
end)
