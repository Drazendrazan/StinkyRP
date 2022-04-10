ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ['Ekstaza'] --

function animka1()
	local dict = "amb@world_human_bum_slumped@male@laying_on_left_side@base"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	Citizen.Wait(10)
	end
	TaskPlayAnim(PlayerPedId(), dict, "base", 8.0, 8.0, 20000, 1, 0, false, false, false)
end

RegisterNetEvent('EkstazaxSKA')
AddEventHandler('EkstazaxSKA', function()
    animka1()
    Citizen.Wait(1000)
    DoScreenFadeOut(1000)
    Citizen.Wait(10000)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(PlayerPedId())
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(PlayerPedId(), 0)
    SetPedIsDrunk(PlayerPedId(), false)
    SetPedMotionBlur(PlayerPedId(), false)
    SetPedArmour(PlayerPedId(), 5)
end)