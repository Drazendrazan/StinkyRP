ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

--[[RegisterNetEvent("esx_logs:screenshot")
AddEventHandler("esx_logs:screenshot", function()
    local screenshot = nil
    exports['screenshot-basic']:requestScreenshotUpload('https://sxcu.net/api/files/create', 'file', function(dataa)
      local resp = json.decode(dataa)
      screenshot = resp.url..".jpeg"
    end)
    TriggerServerEvent('move_logs:triggerLog', 'Posiada kamze powyzej 75 bez joba SASP', 10181046, 'https://discord.com/api/webhooks/930492684869730316/nrnXT_neb9PEcknBFZeWpOce6ZnqY4lD2wDvVPOmQknZw1NK5Fo602Vq5VwOctulN3nN', screenshot)
end)--]]

RegisterCommand("test", function()
    TriggerServerEvent('move_logs:triggerLog', 'Posiada kamze powyzej 75 bez joba SASP', 10181046, 'https://discord.com/api/webhooks/930492684869730316/nrnXT_neb9PEcknBFZeWpOce6ZnqY4lD2wDvVPOmQknZw1NK5Fo602Vq5VwOctulN3nN')
end)