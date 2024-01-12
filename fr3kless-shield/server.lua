ESX = exports['es_extended']:getSharedObject()

local webhook = ""
local fiveguardrscname = ""

RegisterServerEvent('chujciwdupcieessa', function(title, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    powod = ("**Nick:** "..GetPlayerName(source).. "\n**ServerID:** "..source.."\n**Powód:** "..reason.."\n**SteamID:** "..identifier)
    SendWebhookMessage(title, powod)
end)

RegisterServerEvent('kickplejerjebanycwel', function(reason)
    local src = source
    print('Gracz został wyrzucony przez FR3KLESS-SHIELD z powodem "'..reason..'"')
    DropPlayer(src, reason)
end)

RegisterServerEvent('banplejerjebanycwel', function(reason)
    local src = source
    print('Gracz został zbanowany przez FR3KLESS-SHIELD z powodem "'..reason..'"')
    exports[fiveguardrscname]:fg_BanPlayer(src, reason, true)
end)

RegisterServerEvent("gagri:gagri", function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	 -- print(src.." | "..GetPlayerName(src).." | WYKRYTO U GRACZA HITBOXY")
    local reason = 'Wykryto u gracza powiększone głowy'
    local identifier = xPlayer.identifier
    local powod = ("**Nick:** "..GetPlayerName(source).. "\n**ServerID:** "..source.."\n**Powód:** "..reason.."\n**SteamID:** "..identifier)
    SendWebhookMessage('Anti Bigger Hitboxes', powod)
    exports[fiveguardrscname]:fg_BanPlayer(src, 'WYKRYTO U GRACZA HITBOXY', true)
end)


function SendWebhookMessage(title, powod)
    PerformHttpRequest(webhook, function(E, F, G)
    end, "POST", json.encode({embeds = {{
        color = 15548997,
        title = title,
        description = powod,
        timestamp = os.date('!%Y-%m-%dT%H:%M:%S'),
    }}}), { ["Content-Type"] = "application/json" })
end
