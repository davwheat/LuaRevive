AddEventHandler('playerSpawned', function()
  Citizen.Trace("Disabling autospawn...")
  exports.spawnmanager:spawnPlayer() -- Ensure player spawns into server.
  Citizen.Wait(60)
  exports.spawnmanager:setAutoSpawn(false)
  Citizen.Trace("Autospawn disabled!")
end)

RegisterNetEvent("reviveSelf")
AddEventHandler("reviveSelf", function()
  local pedPos = GetEntityCoords(GetPlayerPed(-1), true)

	NetworkResurrectLocalPlayer(playerPos, true, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)
  ResurrectPed(GetPlayerPed(-1))
  SetEntityHealth(GetPlayerPed(-1), 200)
  ClearPedTasksImmediately(GetPlayerPed(-1))
  SetEntityCoords(GetPlayerPed(-1), pedPos.x, pedPos.y, pedPos.z + 1.0, 0, 0, 0, 0)
  
  Notification("You revived yourself")
end)

RegisterNetEvent("reviveOther")
AddEventHandler("reviveOther", function(pedId)
  local otherPedPos = GetEntityCoords(GetPlayerPed(pedId), true)
  local otherPed = GetPlayerPed(pedId)

  loadAnimDict("mini@cpr@char_a@cpr_st")
  loadAnimDict("mini@cpr@char_a@cpr_def")

  local heading = GetEntityHeading(otherPed)
  SetEntityCoords(otherPed, otherPedPos.x + (frontx *2), otherPedPos.y + (fronty * 2), otherPedPos.z + 1, 1, 0, 0, 1)
  SetEntityHeading(otherPed, heading - 180)

  TaskPlayAnim(player, "mini@cpr@char_a@cpr_def", "cpr_intro", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
  Wait(2000)
  TaskPlayAnim(player, "mini@cpr@char_a@cpr_st", "cpr_pumpchest", 8.0, 1.0, -1, 9, 0, 0, 0, 0)
  Wait(7000)
  TaskPlayAnim(player, "mini@cpr@char_a@cpr_def", "cpr_success", 8.0, 1.0, -1, 2, 0, 0, 0, 0)

	NetworkResurrectLocalPlayer(otherPedPos, true, true, false)
	SetPlayerInvincible(otherPed, false)
	ClearPedBloodDamage(otherPed)
  ResurrectPed(GetPlayerPed(-1))
  SetEntityHealth(GetPlayerPed(-1), 200)
  ClearPedTasksImmediately(GetPlayerPed(-1))
  SetEntityCoords(GetPlayerPed(-1), otherPedPos.x, otherPedPos.y, otherPedPos.z + 1.0, 0, 0, 0, 0)
  
  Notification("Revived "..GetPlayerName(pedId))
end)

Citizen.CreateThread(function( ... )
  ped = GetPlayerPed(-1)
	while true do 
    Citizen.Wait(1)
    if (IsEntityDead(ped)) then
      SetPlayerInvincible(ped, true)
      SetEntityHealth(ped, 1)
    end
	end
end)

function Notification(message)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(message)
  DrawNotification(0,1)
end

function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Citizen.Wait(5)
  end
end