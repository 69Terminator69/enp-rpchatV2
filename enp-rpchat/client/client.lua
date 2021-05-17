----------------- CREATE BY termidev#9944 ----------------- 
----------------- EDIT BY ᴀʀɪᴜᴋʏ®#3449 --------------------


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)    

RegisterNetEvent('enp-rpchat:sendProximity')
AddEventHandler('enp-rpchat:sendProximity', function(playerId, name, message, type)
    local player = PlayerId()
    local target = GetPlayerFromServerId(playerId)

    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

    if NetworkIsPlayerActive(player) and (target == player or #(playerCoords - targetCoords) < 15) then
        if type == "ooc" then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 2px; border: 2px solid rgba(80, 80, 80, 0.8); margin: 1px; size : 10px; background-color: rgba(167, 167, 167, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6{0} OPP : ^0{1}</div>',
                color = { 255, 255, 255},
                args = { "["..playerId.."] "..name, message}
            })
        elseif type == "me" then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 2px; border: 2px solid rgba(110, 0, 194, 0.8); margin: 1px; size : 10px; background-color: rgba(255, 128, 242, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6{0} Me : ^0{1}</div>',
                color = { 255, 255, 255},
                args = {"["..playerId.."] "..name, message}
            }) 
          
        elseif type == "do" then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 2px; border: 2px solid rgba(255, 187, 51, 0.8); margin: 1px; background-color: rgba(255, 187, 51, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> {0} ^6Do : ^0{1}</div>',
                color = { 255, 255, 255},
                args = { "["..playerId.."] "..name, message}
            })
        end
    end
end)

RegisterCommand('dados', function(source)   ExecuteCommand('me Tira un dado y sale ' ..math.random( 1, 6)) end) 

RegisterCommand('moneda', function(source) local coin = math.random( 0, 1 ) if coin == 0 then ExecuteCommand('me Tira una moneda al aire y sale cara') elseif coin == 1 then ExecuteCommand('me Tira una moneda al aire y sale cruz') end end)

RegisterNetEvent("enp-msg:Received")
AddEventHandler('enp-msg:Received', function(source, textmsg, names2, names3 )
	textData.hasRecievedMessage = true
	textData.lastPlayerMessage = textmsg
	textData.lastPlayermessageRecieved = source
	textData.lastMessagenames2 = names3

    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 2px; border: 2px solid rgba(255, 187, 51, 0.8); margin: 1px; background-color: rgba(255, 187, 51, 0.2); border-radius: 3px;"><i class="fas fa-user"></i>  ^6 ['.. source ..'] MSG de: '..names3..'  : ^0{0}</div>',
        color = { 255, 255, 255},
        args = {textmsg}
    })

	PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent("enp-msg:Sent")
AddEventHandler('enp-msg:Sent', function(tPID, names2)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 2px; border: 2px solid rgba(255, 187, 51, 0.8); margin: 1px; background-color: rgba(255, 187, 51, 0.2); border-radius: 3px;"><i class="fas fa-user"></i>  ^6 ['..tPID..'] Has enviado un mensaje privado a: '..names2..' ^0</div>',
        color = { 255, 255, 255}
    })
end)


textData = {
    hasRecievedMessage = false,
    lastPlayerMessage = "",
    lastPlayermessageRecieved = 0,
    lastMessageName = ""
}

local group

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	print('group setted ' .. g)
	group = g
end)

RegisterNetEvent('sendMessageAdmin')
AddEventHandler('sendMessageAdmin', function(id, name, message)
  TriggerServerEvent('getadmin')
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(19, 0, 255, 0.8); margin: 1px; background-color: rgba(19, 0, 255, 0.5); border-radius: 3px;"><i class="fas fa-user"></i>  ^6 '..name..' STAFF : ^0{0}</div>',
            color = { 255, 255, 255},
            args = {message}
        })
 	elseif group ~= 'user' and pid ~= myId then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(19, 0, 255, 0.8); margin: 1px; background-color: rgba(19, 0, 255, 0.5); border-radius: 3px;"><i class="fas fa-user"></i>  ^6 '..name..' STAFF : ^0{0}</div>',
            color = { 255, 255, 255},
            args = {message}
        })
    end
end)