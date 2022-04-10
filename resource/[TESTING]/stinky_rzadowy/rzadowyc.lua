ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

local announcestring = false

RegisterNetEvent("rzadowy:call")
AddEventHandler("rzadowy:call", function(nazwa)
	announcestring = 'Administrator: ~g~'..nazwa..'~s~ zaprasza Cię na kanał pomocy'
	PlaySoundFrontend(-1, "DELETE", "HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(10000)
	announcestring = false
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~r~Administrator Cię woła")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if announcestring then
			scaleform = Initialize("mp_big_message_freemode")
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		else
			Citizen.Wait(500)
		end
	end
end)