ESX = nil
local PlayerData = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
    end
	
	Citizen.Wait(5000)
	
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
    local data = xPlayer
	local accounts = data.accounts
	local job = data.job
end)

-------------
-- ZMIENNE --
-------------

local PodczasSluzby = false
local BlipCelu = nil
local BlipZakonczenia = nil
local BlipAnulowania = nil
local PozycjaCelu = nil
local MaPaczke = false
local ObokVana = false
local OstatniCel = 0
local LiczbaDostaw = 0
local Rozwieziono = false
local xxx = nil
local yyy = nil
local zzz = nil
local Blipy = {}
local JuzBlip = false
local DostarczaPaczke = false
local posiadaVana = false
local MozePracowac = false

------------------------
-- PODSTAWOWE FUNKCJE --
------------------------

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)



--Sprawdzenie pracy
--[[RegisterNetEvent('esx_kurier:UstalPrace')
AddEventHandler('esx_kurier:UstalPrace', function(job)
	if job == 'deliverer' then
		Zatrudniony = true
	end
end)]]

--Tworzenie blipa pracy
CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not JuzBlip then
            Blipy['praca'] = AddBlipForCoord(-414.8303, -2796.4055, 5.0504)
            SetBlipSprite(Blipy['praca'], 478)
            SetBlipDisplay(Blipy['praca'], 4)
            SetBlipScale(Blipy['praca'], 0.9)
            SetBlipColour(Blipy['praca'], 5)
            SetBlipAsShortRange(Blipy['praca'], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('PostOP')
            EndTextCommandSetBlipName(Blipy['praca'])
                        JuzBlip = true
        else
            Citizen.Wait(5000)
        end
    end
end)

-- Spawn Samochodu
function WyciagnijPojazd()
    if ESX.Game.IsSpawnPointClear(Config.Strefy.Spawn.Pos, 7) then
        if posiadaVana == true then
            --TriggerEvent('pNotify:SendNotification', {text = 'Wypożyczyłeś/aś już pojazd! Anuluj  lub zakończ aktualne zlecenie, aby otrzymać nowy!', timeout = 20000})
            ESX.ShowNotification('Wypożyczyłeś/aś już pojazd! Anuluj  lub zakończ aktualne zlecenie, aby otrzymać nowy!')
        elseif posiadaVana == false then
            --[[if PlayerData.job.grade >= 3 then
                ESX.Game.SpawnVehicle('sprinter211', Config.Strefy.Spawn.Pos, Config.Strefy.Spawn.Heading, function(vehicle)
                    platenum = math.random(10, 99)
                    SetVehicleNumberPlateText(vehicle, "KURIER"..platenum)
                    SetVehicleCustomPrimaryColour(vehicle, 211, 187, 124)
                    --MissionLivraisonSelect()
                    plaquevehicule = "KURIER"..platenum
                    --TriggerServerEvent('kurier:insertSmiec', plaquevehicule)
                end)
            else]]
                ESX.Game.SpawnVehicle('gopostal', Config.Strefy.Spawn.Pos, Config.Strefy.Spawn.Heading, function(vehicle)
                    platenum = math.random(10, 99)
                    SetVehicleNumberPlateText(vehicle, "KURIER"..platenum)
                    SetVehicleCustomPrimaryColour(vehicle, 211, 187, 124)
                    --MissionLivraisonSelect()
                    plaquevehicule = "KURIER"..platenum
                    --TriggerServerEvent('kurier:insertSmiec', plaquevehicule)
                end)
           --end
            PodczasSluzby = true
            --TriggerEvent("pNotify:SendNotification", {text = 'Twój Van czeka na Ciebie przy ulicy!'})
            ESX.ShowNotification('~y~Twój Van czeka na Ciebie przy ulicy!')
            LosujCel()
            DodajBlipaAnulowania()
            posiadaVana = true
            Citizen.Wait(15000)
            local playerPed = PlayerPedId()
            
            if IsPedInAnyVehicle(playerPed, false)  then
                local vehicle   = GetVehiclePedIsIn(playerPed, false)
            end
        end
    else
        --TriggerEvent("pNotify:SendNotification", {text = 'Miejsce parkingowe jest już zajęte przez inny pojazd!'})
        ESX.ShowNotification('~r~Miejsce parkingowe jest już zajęte przez inny pojazd!')
    end
end

-- Garaz
CreateThread(function()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
    while true do
        Citizen.Wait(0)
        if PlayerData.job ~= nil and PlayerData.job.name == 'gopostal' then
			local sleep = true
			
            if MozePracowac then
                local Gracz = PlayerPedId()
                local Pozycja = GetEntityCoords(Gracz)
				
				local Dystans = #(Pozycja - vec3(Config.Strefy.Pojazd.Pos.x, Config.Strefy.Pojazd.Pos.y, Config.Strefy.Pojazd.Pos.z))
                if Dystans <= 10.0 then  
					sleep = false
                    DrawMarker(27, Config.Strefy.Pojazd.Pos.x, Config.Strefy.Pojazd.Pos.y, Config.Strefy.Pojazd.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 150, 255, 100, false, false, 2, false, nil, nil, false)
                    if Dystans <= 2.5 then
                        ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, Aby wybrać pojazd')
                        ESX.ShowFloatingHelpNotification('~b~ GARAŻ', vec3(Config.Strefy.Pojazd.Pos.x, Config.Strefy.Pojazd.Pos.y, Config.Strefy.Pojazd.Pos.z + 1))
                        if IsControlJustReleased(0, 38) then
                            WyciagnijPojazd()
                            
                        end
                    end
                end
            end
			
			if sleep then
				Citizen.Wait(250)
			end
        else
            Citizen.Wait(2000)
        end
    end
end)

-----------------------
-- WYSZUKIWANIE CELU --
-----------------------

function LosujCel()
    local LosowyPunkt = math.random(1, 21)
    if LiczbaDostaw == 10 then
        ESX.ShowNotification('~y~Dostarczno już wszystkie paczki! ~r~Wróć do magazynu!')
        UsunBlipaAnulowania()
        SetBlipRoute(BlipCelu, false)
        DodajBlipaZakonczenia()
        Rozwieziono = true
		xxx = nil
		yyy = nil
		zzz = nil
    else
        if OstatniCel == LosowyPunkt then
            LosujCel()
        else
            if LosowyPunkt == 1 then
								xxx =85.003
								yyy =561.640
								zzz =182.773
                OstatniCel = 1
            elseif LosowyPunkt == 2 then
								xxx =-717.825
								yyy =448.643
								zzz =106.909
                OstatniCel = 2
            elseif LosowyPunkt == 3 then
								xxx =-588.048
								yyy =-783.517
								zzz =25.200
                OstatniCel = 3
            elseif LosowyPunkt == 4 then
								xxx =20.470
								yyy =-1505.479
								zzz =31.850
                OstatniCel = 4
            elseif LosowyPunkt == 5 then
								xxx =389.979
								yyy =-1433.028
								zzz =29.431
                OstatniCel = 5
            elseif LosowyPunkt == 6 then
								xxx =467.080
								yyy =-1590.276
								zzz =32.792
                OstatniCel = 6
            elseif LosowyPunkt == 7 then
								xxx =-339.067
								yyy =21.460
								zzz =47.858
                OstatniCel = 7
            elseif LosowyPunkt == 8 then
								xxx =-333.027
								yyy =56.902
								zzz =54.429
                OstatniCel = 8
            elseif LosowyPunkt == 9 then
								xxx =1245.260
								yyy =-1626.665
								zzz =53.282
                OstatniCel = 9
            elseif LosowyPunkt == 10 then
								xxx =1214.374
								yyy =-1644.1259
								zzz =48.6459
                OstatniCel = 10
            elseif LosowyPunkt == 11 then
								xxx =437.141
								yyy =-978.651
								zzz =30.689
                OstatniCel = 11
            elseif LosowyPunkt == 12 then
								xxx =126.678
								yyy =-1929.798
								zzz =21.382
                OstatniCel = 12
            elseif LosowyPunkt == 13 then
								xxx =-5.0513
								yyy =-1872.062
								zzz =24.151
                OstatniCel = 13
            elseif LosowyPunkt == 14 then
								xxx =-80.589
								yyy =-1608.237
								zzz =31.480
                OstatniCel = 14
            elseif LosowyPunkt == 15 then
								xxx =-27.885
								yyy =-1103.904
								zzz =26.422
                OstatniCel = 15
            elseif LosowyPunkt == 16 then
								xxx =344.731
								yyy =-205.027
								zzz =58.019
                OstatniCel = 16
            elseif LosowyPunkt == 17 then
								xxx =340.956
								yyy =-214.876
								zzz =58.019
                OstatniCel = 17
            elseif LosowyPunkt == 18 then
								xxx =337.132
								yyy =-224.712
								zzz =58.019
                OstatniCel = 18
            elseif LosowyPunkt == 19 then
								xxx =331.373
								yyy =-225.865
								zzz =58.019
                OstatniCel = 19
            elseif LosowyPunkt == 20 then
								xxx =337.158
								yyy =-224.729
								zzz =54.221
                OstatniCel = 20
            elseif LosowyPunkt == 21 then
								xxx =-386.907
								yyy =504.108
								zzz =120.412
                OstatniCel = 21
            end
		    DodajBlipaDoCelu(PozycjaCelu)
            ESX.ShowNotification('Zawieź paczkę do odbiorcy! Jedź ostrożnie i nie śpiesz się!')
        end
    end
end

----------------------
-- TWORZENIE BLIPÓW --
----------------------

-- Blip celu podrózy
function DodajBlipaDoCelu(PozycjaCelu)
    Blipy['cel'] = AddBlipForCoord(xxx, yyy, zzz)
    SetBlipRoute(Blipy['cel'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Odbiorca Paczki')
	EndTextCommandSetBlipName(Blipy['cel'])
end

-- Blip anulowania pracy
function DodajBlipaAnulowania()
    Blipy['anulowanie'] = AddBlipForCoord(-455.1666, -2799.2969, 5.0503)
		SetBlipColour(Blipy['anulowanie'], 59)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Anuluj Zlecenia')
	EndTextCommandSetBlipName(Blipy['anulowanie'])
end

-- Blip zakonczenia pracy
function DodajBlipaZakonczenia()
    Blipy['zakonczenie'] = AddBlipForCoord(-455.1666, -2799.2969, 5.0503)
		SetBlipColour(Blipy['zakonczenie'], 2)
    SetBlipRoute(Blipy['zakonczenie'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Zakończ Pracę')
	EndTextCommandSetBlipName(Blipy['zakonczenie'])
end

---------------------
-- USUWANIE BLIPÓW --
---------------------

function UsunBlipaCelu()
    RemoveBlip(Blipy['cel'])
end

function UsunBlipaAnulowania()
    RemoveBlip(Blipy['anulowanie'])
end

function UsunWszystkieBlipy()
    RemoveBlip(Blipy['cel'])
    RemoveBlip(Blipy['anulowanie'])
    RemoveBlip(Blipy['zakonczenie'])
end

--------------------
-- STREFA DOSTAWY --
--------------------

CreateThread(function()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
    while true do

        Citizen.Wait(0)

        local Gracz, sleep = PlayerPedId(), true
        local Pozycja = GetEntityCoords(Gracz)
		
		if xxx ~= nil and yyy ~= nil and zzz ~= nil then
			local Dystans = #(Pozycja - vec3(xxx, yyy, zzz))
			
			if Dystans <= 25.0 and (PlayerData.job ~= nil and PlayerData.job.name == 'gopostal') and (not MaPaczke) then
				sleep = false
				ESX.ShowFloatingHelpNotification('~b~ ZABIERZ PACZKE Z VANA', vec3(xxx, yyy, zzz))
				local pojazd = GetClosestVehicle(Pozycja, 6.0, 0, 70)
				if IsVehicleModel(pojazd, `gopostal`) then
					local pozycjaPojazdu = GetEntityCoords(pojazd)
					local Odleglosc = #(Pozycja - pozycjaPojazdu)
					
					--ESX.ShowFloatingHelpNotification('~b~ PACZKA ~s~[~g~E~s~]', pozycjaPojazdu)
                    --ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, aby wyjac paczke!')
					if Dystans >= 2 and Odleglosc <= 3 then
                        ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, aby wyjac paczke!')
						ObokVana = true
					end
				end
			end
			if Dystans <= 25 and MaPaczke and (PlayerData.job ~= nil and PlayerData.job.name == 'gopostal') then
				sleep = false
				ESX.ShowFloatingHelpNotification('~b~ PUNKT DOSTAWY ~s~[~g~E~s~]', vec3(xxx, yyy, zzz))
				if Dystans <= 3 then
					
					if IsControlJustReleased(0, 38) then
						WezPaczke()
						DostarczPaczke()
					end
				end
			end
		end
		
        if sleep then
            Citizen.Wait(250)
        end
    end
end)

CreateThread(function()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
	
	while true do
        Citizen.Wait(10)
        if PlayerData.job ~= nil and PlayerData.job.name == 'gopostal' then
            if (not MaPaczke) and ObokVana then
                if IsControlJustReleased(0, 38) then
                    Citizen.Wait(100)
                    WezPaczke()
                    ObokVana = false
                end
			else
				Citizen.Wait(250)
            end
        else
            Citizen.Wait(2000)
        end
	end
end)

--------------------
-- DOSTAWA PACZKI --
--------------------

function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

function WezPaczke()
    local player = PlayerPedId()
    if not IsPedInAnyVehicle(player, false) then
        local ad = "anim@heists@box_carry@"
        local prop_name = 'hei_prop_heist_box'
        if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
            loadAnimDict( ad )
            if MaPaczke then
                TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
                DetachEntity(prop, 1, 1)
                DeleteObject(prop)
                Wait(1000)
                ClearPedSecondaryTask(PlayerPedId())
                MaPaczke = false
            else
                local x,y,z = table.unpack(GetEntityCoords(player))
                prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
                AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
                TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
                MaPaczke = true
            end
        end
    end
end

function DostarczPaczke()
    if not DostarczaPaczke then
        DostarczaPaczke = true
        LiczbaDostaw = LiczbaDostaw + 1
        UsunBlipaCelu()
        SetBlipRoute(BlipCelu, false)
        MaPaczke = false    
        KolejnaDostawa()
        Citizen.Wait(2500)
        DostarczaPaczke = false
    end
end

function KolejnaDostawa()
    TriggerServerEvent('esx_kurier:pay')
    Citizen.Wait(300)
    LosujCel()
end


------------------
-- KONIEC PRACY --
------------------

CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Gracz = PlayerPedId()
        local Pozycja = GetEntityCoords(Gracz)

		local DystansOdStrefyZakonczenia = #(Pozycja - vec3(-455.1666, -2799.2969, 5.0503))
        local DystansOdStrefyAnulowania = #(Pozycja - vec3(-455.1666, -2799.2969, 5.0503))
		
        if PodczasSluzby then
			local sleep = true
			
            if Rozwieziono then
                if DystansOdStrefyZakonczenia <= 25 then
					sleep = false
                    DrawMarker(27, -455.1666, -2799.2969, 5.0503, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 0.5, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)
                    if DystansOdStrefyZakonczenia <= 2.5 then
                        ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, Aby zakończyć pracę')
                        if IsControlJustReleased(0, 38) then
                            --TriggerEvent('pNotify:SendNotification', {text = 'Zakończono pracę! Odpocznij chwilę, kolejne przesyłki już czekają!'})
                            ESX.ShowNotification('~r~Zakończono pracę! ~s~Odpocznij chwilę, kolejne przesyłki już czekają!')
                            KoniecPracy()
                        end
                    end
                end
            else
                if DystansOdStrefyAnulowania <= 25 then
					sleep = false
                    DrawMarker(27, -455.1666, -2799.2969, 5.0503, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 0.5, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)
                    if DystansOdStrefyAnulowania <= 2.5 then
                        ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, Aby anulować pracę')
                        
                        if IsControlJustReleased(0, 38) then
                            --TriggerEvent('pNotify:SendNotification', {text = 'Anulowano zlecenie!'})
                            ESX.ShowNotification('~r~Anulowano zlecenie!')
							KoniecPracy()
                        end
                    end
                end
            end
			
			if sleep then
				Citizen.Wait(250)
			end
        else
            Citizen.Wait(2000)
        end
    end
end)

function KoniecPracy()
    UsunWszystkieBlipy()
    local Gracz = PlayerPedId()
    if IsPedInAnyVehicle(Gracz, false) then
        local Van = GetVehiclePedIsIn(Gracz, false)
        if IsVehicleModel(Van, `gopostal`) or IsVehicleModel(Van, `sprinter211`) then
            ESX.Game.DeleteVehicle(Van)
 
            PodczasSluzby = false
            BlipCelu = nil
            BlipZakonczenia = nil
            BlipAnulowania = nil
            PozycjaCelu = nil
            MaPaczke = false
            OstatniCel = nil
            LiczbaDostaw = 0
            xxx = nil
            yyy = nil
            zzz = nil
            posiadaVana = false
            Rozwieziono = false
        else
            ESX.ShowNotification('~r~Musisz zwrócić pojazd kurierski!')
            ESX.ShowNotification('~r~Jeśli straciłeś Vana, wyjdź z pojazdu i anuluj pracę pieszo!')
        end
    else
        ESX.ShowNotification('~r~Kaucja nie została zwrócona!')
        PodczasSluzby = false
        BlipCelu = nil
        BlipZakonczenia = nil
        BlipAnulowania = nil
        PozycjaCelu = nil
        MaPaczke = false
        OstatniCel = nil
        LiczbaDostaw = 0
        xxx = nil
        yyy = nil
        zzz = nil
        posiadaVana = false
        Rozwieziono = false
    end
end



AddEventHandler('exile_courier:enteredMarker', function(zone)
	if zone == 'BossActions' then
		CurrentAction	  = 'boss_actions'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wejść do menu zarządzania"
        CurrentActionData = {}
    elseif zone == 'Ciuchy' then
		CurrentAction	  = 'ciuszki'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby przebrać się w ubrania robocze"
		CurrentActionData = {}
    end
end)

AddEventHandler('exile_courier:exitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)


CreateThread(function()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
	while true do
		Citizen.Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'gopostal' then
			local coords = GetEntityCoords(PlayerPedId())
			local isInMarker, letSleep, currentZone = false, true

			for k,v in pairs(Config.Strefy2) do
				local distance = #(coords - vec3(v.Pos.x, v.Pos.y, v.Pos.z))

				if v.Type ~= -1 and distance < Config.DrawDistance then
					letSleep = false
					DrawMarker(27, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, v.Rotate, nil, nil, false)
				end

				if distance < v.Size.x then
					isInMarker, currentZone = true, k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				TriggerEvent('exile_courier:enteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('exile_courier:exitedMarker', LastZone)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

CreateThread(function()
	while true do
        Citizen.Wait(0)
        if CurrentAction and not IsDead then
			ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, 38) and PlayerData.job and PlayerData.job.name == 'gopostal' then
                if CurrentAction == 'boss_actions' then
                    OpenBossMenu()
                elseif CurrentAction == 'ciuszki' then
                    CiuchyMenu()
                end
                CurrentAction = nil
            end
		else
			Citizen.Wait(250)
        end
    end
end)

CreateThread(function()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
	
	while true do
        Citizen.Wait(7)
		if PlayerData.job and PlayerData.job.name == 'gopostal' and PlayerData.job.grade >= 3 then
			if IsControlJustReleased(0, 167) then
				OpenKurierF6Menu()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function OpenBossMenu()
	local elements = {
		{label = "Akcje szefa", value = '1'},
    }

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'courier_actionss', {
		title    = "Kurier",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == '1' then
			if PlayerData.job.grade >= 7 then
				TriggerEvent('esx_society:openBossMenu', 'gopostal', function(data, menu)
					menu.close()
				end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			elseif PlayerData.job.grade == 6 then
				TriggerEvent('esx_society:openBossMenu', 'gopostal', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = true})
			else
				TriggerEvent('esx_society:openBossMenu', 'gopostal', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = false})
            end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wejść do menu"
		CurrentActionData = {}
	end)
end

function CiuchyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = 'Przebieralnia',
		align = 'center',
		elements = {
			{label = 'Ubrania robocze',     value = 'job_wear'},
			{label = 'Ubrania prywatne', value = 'citizen_wear'}
		}
	}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			MozePracowac = false
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'job_wear' then
			MozePracowac = true
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end