
----------------- CREATE BY termidev#9944 ----------------- 
----------------- EDIT BY ᴀʀɪᴜᴋʏ®#3449 --------------------

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- OOC LOCAL (PROXIMIDAD)
AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = GetPlayerName(source)
        --TriggerClientEvent('enp-rpchat:sendProximity', -1, source, name, message, "ooc")
    end
    CancelEvent()
end)

RegisterCommand('oop', function(source, args)
    if source > 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
        if args then
            TriggerClientEvent('enp-rpchat:sendProximity', -1, source, name, args, "ooc")
        end
    end
end, false)

RegisterCommand('me', function(source, args)
    if source > 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
        if args then
            TriggerClientEvent('enp-rpchat:sendProximity', -1, source, name, args, "me")
        end
    end
end, false)

RegisterCommand('do', function(source, args)
    if source > 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
        if args then
            TriggerClientEvent('enp-rpchat:sendProximity', -1, source, name, args, "do")
        end
    end
end, false)

RegisterCommand('ayuda', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)

	TriggerClientEvent('chat:addMessage',  -1, {
		template = '<div style="padding: 2px; border: 2px solid rgba(220, 255, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(240, 240, 143, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6{0} AYUDA : ^0{1}</div>',
		color = { 255, 255, 255},
		args = {"["..source.."] "..name, args}
	}) 
end, false)

RegisterCommand('tw', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
    local namepj = GetCharacterName(source)
	TriggerClientEvent('chat:addMessage',  -1, {
		template = '<div style="padding: 2px; border: 2px solid rgba(0, 135, 255, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 236, 255, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6{0} TWITTER : ^0{1}</div>',
		color = { 255, 255, 255},
		args = {"["..source.."] "..namepj, args}
	}) 
end, false)

RegisterCommand('pol', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "police" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(0, 135, 255, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 236, 255, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🚔| POLICIA : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 
	end
end, false)

RegisterCommand('meca', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(128, 63, 2, 0.8); margin: 1px; size : 10px; background-color: rgba(239, 158, 81, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🔧| MECANICO : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 

	end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end


		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(255, 0, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(245, 96, 96, 0.5); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🚑| EMS : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 

	end
end, false)

RegisterCommand('badu', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "badulake" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(42, 255, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(42, 255, 0, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🛒| BADULAKE : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 
	end
end, false)

RegisterCommand('taxi', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "taxi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(255, 251, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(255, 251, 0, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🚕|  TAXI : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 
	end
end, false)

RegisterCommand('weed', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "weedshop" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(0, 142, 28, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 142, 28, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🍁| WeedShop : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 
	end
end, false)

RegisterCommand('fbi', function(source, args, rawCommand)
	if source == 0 then
		print('enp-rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "fbi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(93, 93, 93, 0.8); margin: 1px; size : 10px; background-color: rgba(93, 93, 93, 0.5); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🕵️‍♂️| CNI : ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 
	end
end, false)

RegisterCommand('rpol', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "police" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(0, 135, 255, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 236, 255, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 👮‍♂️| POLICÍA PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		}) 

    else
        TriggerClientEvent('esx:showNotification',source,"No eres policia.")
    end
end, false)

RegisterCommand('rems', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "ambulance" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
		
		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(255, 0, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(245, 96, 96, 0.5); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 👨‍⚕️| EMS PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		})
		
    else
        TriggerClientEvent('esx:showNotification',source,"No eres médico.")
    end
end, false)

RegisterCommand('rmeca', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "mechanic" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(128, 63, 2, 0.8); margin: 1px; size : 10px; background-color: rgba(239, 158, 81, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🔨| MECÁNICO PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		})

    else
        TriggerClientEvent('esx:showNotification',source,"No eres mecánico.")
    end
end, false)

RegisterCommand('rtaxi', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "taxi" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")

		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(255, 251, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(255, 251, 0, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🚖| TAXI PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		})

    else
        TriggerClientEvent('esx:showNotification',source,"No eres taxista.")
    end
end, false)

RegisterCommand('rpp', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "ambulance" or target.job.name == "police" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
		
		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(255, 0, 0, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 212, 255, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 🚔🚑 | POLICÍA & EMS PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		})

        TriggerClientEvent('chat:addMessage', -1, { args = { ' 🚔🚑 | POLICÍA & EMS PRIVADO: ^4' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^7 '..args }, color = { 179, 255, 217 } })
    else
        TriggerClientEvent('esx:showNotification',source,"No eres ni polcia ni ems.")
    end
end, false)

RegisterCommand('rff', function(source, args, rawCommand)
    if source == 0 then
        print('enp-rpchat: you can\'t use this command from rcon!')
        return
    end

    local target = ESX.GetPlayerFromId(source)

    if target.job ~= nil and target.job.name == "fbi" or target.job.name == "police" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        args = table.concat(args, " ")
		TriggerClientEvent('chat:addMessage',  -1, {
			template = '<div style="padding: 2px; border: 2px solid rgba(93, 93, 93, 0.8); margin: 1px; size : 10px; background-color: rgba(0, 212, 255, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6  '..'['..source..']' ..' 👮‍🕵️‍♂️| POLICÍA & FBI PRIVADO: ^1' ..name..' ^1 '..xPlayer.job.grade_label.. ' ^0{0}</div>',
			color = { 255, 255, 255},
			args = {args}
		})
       
    else
        TriggerClientEvent('esx:showNotification',source,"No eres ni policia ni fbi.")
    end
end, false)


RegisterCommand('sf', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendMessageAdmin", -1, source,  xPlayer.getName(), table.concat(args, " "))
	end	
end, false)


RegisterCommand('msg', function(source, args, raw)
	cm = stringsplit(raw, " ")
	local tPID = tonumber(args[1])
	local names2 = GetPlayerName(tPID)
	local names3 = GetPlayerName(source)
	local msgVar = {}
	local textmsg = ""
	for i=1, #cm do
		if i ~= 1 and i ~= 2 then
			textmsg = (textmsg .. " " .. tostring(cm[i]))
		end
	end	
	
	TriggerClientEvent('enp-msg:Received', tPID, source, textmsg, names2, names3)
	TriggerClientEvent('enp-msg:Sent', source, tPID, names2)
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

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

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
  
function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end

print('🆃🅴🆁🅼🅸🅳🅴🆅')