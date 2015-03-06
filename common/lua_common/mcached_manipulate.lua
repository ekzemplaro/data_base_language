-- ----------------------------------------------------
--	mcached_manipulate.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
json=require	('json')
-- ----------------------------------------------------
function mcached_get_value_proc (client,key)
	local obj = nil
	local command = "get " .. key .. "\r\n"
	client:send(command)
	local ret_0 = client:receive()
	if (ret_0 ~= "END") then
		local ret_1 = client:receive()
--		print( "response: " .. ret_1 )
		obj = json.decode(ret_1)
		local ret_2 = client:receive()
	end

	return	obj
end

-- ----------------------------------------------------
function mcached_to_dict_proc (server_host,server_port,keys)
	dict_aa = {}
	local socket = require('socket')

	local client = socket.connect (server_host,server_port)


	for it in pairs (keys)  do
		local key = keys[it]

		local obj = mcached_get_value_proc (client,key)
		if (obj) then
			dict_aa[key] = obj
		end
	end

	client:close()

	return	dict_aa
end

-- ----------------------------------------------------
function mcached_delete_proc (server_host,server_port,key_in)
	local socket = require('socket')

	local client = socket.connect (server_host,server_port)

	local command = "delete " .. key_in .. "\r\n"
	client:send(command)
	local ret_0 = client:receive()
	print (ret_0)

	client:close()
end

-- ----------------------------------------------------
function mcached_set_value_proc (client,key,unit_aa)
	str_json = json.encode (unit_aa)
	llx =  string.len (str_json)

	command = "set " .. key .. " 0 0 " .. llx .. "\r\n"
	client:send(command)
	client:send(str_json .. "\r\n")
	ret_0 = client:receive()
	print (ret_0)
	
end
-- ----------------------------------------------------
function mcached_update_proc (server_host,server_port,key_in,population_in)
	local socket = require('socket')
	local client = socket.connect (server_host,server_port)

	local unit_aa = mcached_get_value_proc (client,key_in)
	if (unit_aa) then
		unit_aa.population=population_in
		unit_aa.date_mod=get_current_date_proc ()

		mcached_set_value_proc (client,key_in,unit_aa)

	end
	client:close ()
end

-- ----------------------------------------------------
function dict_to_mcached_proc (server_host,server_port,dict_aa)

	local socket = require('socket')

	local client = socket.connect (server_host,server_port)

	for key,unit_aa in pairs (dict_aa)
		do
			mcached_set_value_proc (client,key,unit_aa)
		end

	client:close()
end

-- ----------------------------------------------------
