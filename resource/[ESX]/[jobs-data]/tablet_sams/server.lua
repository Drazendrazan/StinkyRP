
ESX = nil
mandatAmount = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)
local societyAccount = nil


function GetRPName(playerId, data)
    local Identifier = ESX.GetPlayerFromId(playerId).identifier
    MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
        data(result[1].firstname, result[1].lastname)
    end)
end

RegisterNetEvent('esx_ambulancejob:Ciagnijpaleidioto')
AddEventHandler('esx_ambulancejob:Ciagnijpaleidioto', function(target, mandatAmount, mandatReason)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
        societyAccount = account
    end)

    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    local identifier = targetXPlayer.getIdentifier()
    local mandat = tonumber(mandatAmount)

    if xPlayer.job.name == 'ambulance' then
        targetXPlayer.removeAccountMoney('bank', mandat)
        sourceXPlayer.addAccountMoney('bank', mandat / 2)
        societyAccount.addMoney(mandat/2)

        GetRPName(target, function(firstname, lastname)
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(50, 255, 43, 0.4); border-radius: 3px;"><i class="fas fa-briefcase-medical"style="font-size:13px;color:rgb(255,255,255,0.5)"></i>&ensp;<font color="FFFFFF">{0}</font>&ensp;<font color="white"></font></div>',
                args = { "^*[^1SAMS^0]: ^1^*" .. firstname .. " " .. lastname .. "^7 Otrzymał fakture medyczną na wysokość ^2".. mandat .."$", }
            })
        end)
    else
        print('WYKRYTO PEDALA NA SERWERZE!')
    end

end)

