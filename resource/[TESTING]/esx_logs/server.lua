ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Config = {
    webhook = {
        none = ''
    }
}

function discordLog2(message, color, channel)
    src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
	PerformHttpRequest(channel, function(err, text, headers) end, 'POST', json.encode({username = "MoveRP", embeds = {{["color"] = color, ["author"] = {["name"] = 'MoveRP',["icon_url"] = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png"}, ["description"] = "Gracz [".. source .."] ".. GetPlayerName(source) .." \nHex: ".. GetPlayerIdentifier(source) .."\nLicencja: ".. identifier .." \n".. message .."",["footer"] = {["text"] = " MoveRP - "..os.date("%x %X %p"),["icon_url"] = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png",},}}, avatar_url = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png"}), { ['Content-Type'] = 'application/json' })
end

function discordLog3(message, color, channel)
    local xPlayer = ESX.GetPlayerFromId(source)
	PerformHttpRequest(channel, function(err, text, headers) end, 'POST', json.encode({username = "MoveRP", embeds = {{["color"] = color, ["author"] = {["name"] = 'MoveRP',["icon_url"] = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png"}, ["description"] = "".. message .."",["footer"] = {["text"] = " MoveRP - "..os.date("%x %X %p"),["icon_url"] = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png",},}}, avatar_url = "https://cdn.discordapp.com/attachments/776566455528325160/930537826460778496/512x512_logo_1.png"}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("move_logs:triggerLog")
AddEventHandler("move_logs:triggerLog", function(message, color, channel)
    local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
    discordLog2(message, color, channel)
end)

function logs(message, color, channel)
    local xPlayer = ESX.GetPlayerFromId(source)
    discordLog3(message, color, channel)
end