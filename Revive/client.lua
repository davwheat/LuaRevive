AddEventHandler('onClientMapStart', function()
	exports.spawnmanager:setAutoSpawn(false)
	exports.spawnmanager:spawnPlayer()
end)

RegisterNetEvent("revive")
AddEventHandler("revive", function()
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), true)
	ResurrectPed(GetPlayerPed(-1))
	SetEntityHealth(GetPlayerPed(-1), 200)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetEntityCoords(GetPlayerPed(-1), plyCoords.x, plyCoords.y, plyCoords.z + 1.0, 0, 0, 0, 0)
	
	Notification("Player revived")
end)

function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
  end