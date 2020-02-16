local CooldownActive = false

RegisterServerEvent('p1-marex:SendPage')
AddEventHandler('p1-marex:SendPage', function(location)
    if not CooldownActive then
        if Config.Mythic then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('successfulPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, _U('successfulPage'))
        end
        TriggerClientEvent('p1-marex:Page', -1, location)
        if Config.CoolDown ~= 0 then
            CooldownTimer()
        end
    else
        if Config.Mythic then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,{ type = 'error', text = _U('recentPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, _U('recentPage'))
        end
    end
end)

function CooldownTimer()
    timeLeft = Config.CoolDown
    CooldownActive = true
	
	while true do
		Citizen.Wait(50000)
		timeLeft = timeLeft - 1

        if timeLeft <= 0 then
            CooldownActive = false
			break
		end
	end
end