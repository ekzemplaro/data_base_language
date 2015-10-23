-- ----------------------------------------------------
--	redis_manipulate.lua
--
--					Feb/13/2015
-- ----------------------------------------------------
json = require("json")
-- ----------------------------------------------------
function redis_keys_fetch_proc (client)
	local keys = {}

	local command = "keys *\r\n"
	client:send(command)
	local ret_0 = client:receive()
--	print (ret_0)
	local nn = string.sub (ret_0,2)
--	print (nn)
	for it = 1,nn do
		ret_0 = client:receive()
		ret_1 = client:receive()
--		print (ret_0)
--		print (ret_1)
		table.insert (keys,ret_1)
	end

	table.sort (keys)

	return keys
end
-- ----------------------------------------------------
function redis_get_value_proc (client,key)
	local obj = nil
	local command = "get " .. key .. "\r\n"
	client:send(command)
	local ret_0 = client:receive()
	if (ret_0 ~= "$-1") then
		local ret_1 = client:receive()
--		print( "response: " .. ret_1 )
		obj = json.decode(ret_1)
	end

	return	obj
end

-- ----------------------------------------------------
function redis_to_dict_proc (server_host,server_port)
	dict_aa = {}
	local socket = require('socket')

	local client = socket.connect (server_host,server_port)

	local keys = redis_keys_fetch_proc (client)

	for it in pairs (keys)  do
		local key = keys[it]

		local obj = redis_get_value_proc (client,key)
		if (obj) then
			dict_aa[key] = obj
		end
	end

	client:close()

	return	dict_aa
end

-- ----------------------------------------------------
function redis_set_value_proc (client,key,unit_aa)
	str_json = json.encode (unit_aa)
	print (key)
	print (str_json)
	str_json2=string.gsub (str_json,"\"","\\\"")
--	print (str_json2)
	command = "set " .. key .. " \"" .. str_json2 .. "\"\r\n"
	client:send(command)
	ret_0 = client:receive()
	print (ret_0)
end
-- ----------------------------------------------------
function redis_update_proc (server_host,server_port,key_in,population_in)
	local socket = require('socket')
	local client = socket.connect (server_host,server_port)

	local unit_aa = redis_get_value_proc (client,key_in)
	if (unit_aa) then
		unit_aa.population=population_in
		unit_aa.date_mod=get_current_date_proc ()

		redis_set_value_proc (client,key_in,unit_aa)

	end
	client:close ()
end
-- ----------------------------------------------------
function redis_delete_proc (server_host,server_port,key_in)
	local socket = require('socket')

	local client = socket.connect (server_host,server_port)

	local command = "del " .. key_in .. "\r\n"
	client:send(command)
	local ret_0 = client:receive()
	print (ret_0)

	client:close()
end

-- ----------------------------------------------------
