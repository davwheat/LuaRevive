AddEventHandler('onClientMapStart', function()
  Citizen.Trace("Disabling autospawn...")
  exports.spawnmanager:spawnPlayer() -- Ensure player spawns into server.
  Citizen.Wait(2500)
  exports.spawnmanager:setAutoSpawn(false)
  Citizen.Trace("Autospawn disabled!")
end)

RegisterNetEvent("revive")
AddEventHandler("revive", function()
  local playerPos = GetEntityCoords(GetPlayerPed(-1), true)

	NetworkResurrectLocalPlayer(playerPos, true, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)
  ResurrectPed(GetPlayerPed(-1))
  SetEntityHealth(GetPlayerPed(-1), 200)
  ClearPedTasksImmediately(GetPlayerPed(-1))
  SetEntityCoords(GetPlayerPed(-1), playerPos.x, playerPos.y, playerPos.z + 1.0, 0, 0, 0, 0)
  
  Notification("Player revived")
end)

Citizen.CreateThread(function( ... )
	while true do 
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