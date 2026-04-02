RegisterNetEvent("cylex_animmenu:ptfx:sync", function ()

    
end)

RegisterNetEvent("cylex_animmenu:ptfx:syncProp", function ()

end)

RegisterServerEvent("ServerEmoteRequest", function (target, emotename, etype)
    print("ServerEmoteRequest: " .. target .. " " .. emotename .. " " .. etype)
    TriggerClientEvent("ClientEmoteRequestReceive", target, emotename, etype)
end)

RegisterServerEvent("ServerEmoteCancel", function (targetPlayerId)
    print("ServerEmoteCancel: " .. targetPlayerId)
    TriggerClientEvent("SyncPlayEmote", source, targetPlayerId)
end)

RegisterServerEvent("ServerValidEmote", function (target, requestedemote, otheremote)
    print("ServerValidEmote: " .. target .. " " .. requestedemote .. " " .. otheremote)
    TriggerClientEvent("SyncPlayEmote", source, otheremote, source)
	TriggerClientEvent("SyncPlayEmoteSource", target, requestedemote)
end)