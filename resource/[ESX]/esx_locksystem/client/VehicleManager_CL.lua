function newVehicle()
    local self = {}

    self.id = nil
    self.plate = nil
    self.lockStatus = nil

    rTable = {}

    rTable.__construct = function(id, plate, lockStatus)
        if(id and type(id) == "number")then
            self.id = id
        end
        if(plate and type(plate) == "string")then
            self.plate = plate
        end
        if(lockStatus and type(lockStatus) == "number")then
            self.lockStatus = lockStatus
        end
    end


    rTable.update = function(id, lockStatus)
        self.id = id
        self.lockStatus = lockStatus
    end


    rTable.lock = function()
        lockStatus = self.lockStatus
        if(lockStatus <= 2)then
            self.lockStatus = 4
            SetVehicleDoorsLocked(self.id, self.lockStatus)
            SetVehicleDoorsLockedForAllPlayers(self.id, 1)
            local title = ('StinkyRP')
            local subject = ('Kontrola Pojazdu')
            local data = ('~y~Status: ~r~Zamknięty \n~y~Nr.Rej: ~w~' ..GetVehicleNumberPlateText(self.id))
            TriggerEvent("FeedM:showAdvancedNotification", title, subject, data, icon, 5000, ((color and tonumber(color)) and 'primary' or color))
            TriggerServerEvent('InteractSound_SV:PlayOnSource','lock', 0.35)
        elseif(lockStatus > 2)then
            self.lockStatus = 1
            SetVehicleDoorsLocked(self.id, self.lockStatus)
            SetVehicleDoorsLockedForAllPlayers(self.id, false)
            local title = ('StinkyRP')
            local subject = ('Kontrola Pojazdu')
            local data = ('~y~Status: ~g~Otwarty \n~y~Nr.Rej: ~w~' ..GetVehicleNumberPlateText(self.id))
            TriggerEvent("FeedM:showAdvancedNotification", title, subject, data, icon, 5000, ((color and tonumber(color)) and 'primary' or color))
            TriggerServerEvent('InteractSound_SV:PlayOnSource','unlock', 0.35)
        end
    end



    rTable.setId = function(id)
        if(type(id) == "number" and id >= 0)then
            self.id = id
        end
    end

    rTable.setPlate = function(plate)
        if(type(plate) == "string")then
            self.plate = plate
        end
    end

    rTable.setLockStatus = function(lockStatus)
        if(type(lockStatus) == "number" and lockStatus >= 0)then
            self.lockStatus = lockStatus
            SetVehicleDoorsLocked(self.id, lockStatus)
        end
    end



    rTable.getId = function()
        return self.id
    end

    rTable.getPlate = function()
        return self.plate
    end

    rTable.getLockStatus = function()
        return self.lockStatus
    end

    return rTable
end
