ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('comprobarEntorno')
AddEventHandler('comprobarEntorno', function(msg, x, y, z, name, ped)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(source)
	local ped = GetPlayerPed(_source)
	
	TriggerEvent('es:getPlayers', function(players)
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('entorno:setBlip', xPlayers[i], name, x, y, z)
				TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Policía', '', '~r~Alerta policía ~n~~w~'.. tonumber(_source) .. ' - ' .. msg, 'CHAR_CALL911', 1)
	            TriggerClientEvent('chatMessage', xPlayers[i], '^*^3Despacho: ^4911 | Localizacion: ^r' .. location .. '^*^4 | Reporte: ^r' .. msg)				
			end
		end
	end)
	TriggerClientEvent("sendProximityMessageEntorno", -1, _source)
end)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
	
