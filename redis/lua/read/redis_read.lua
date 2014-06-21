-- ----------------------------------------------------
--	redis_read.lua
--
--					Apr/18/2013
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

print ("*** 開始 ***")

local server_host = "host_dbase"
local server_port = 6379

local socket = require('socket')

local client = socket.connect (server_host,server_port)

local keys = redis_keys_fetch_proc (client)

for it in pairs (keys)  do
	local key = keys[it]
	local command = "get " .. key .. "\r\n"
	client:send(command)
	local ret_0 = client:receive()
	if (ret_0 ~= "$-1") then
		local ret_1 = client:receive()
--		print( "response: " .. ret_1 )
		json = require("json")
		local obj = json.decode(ret_1)
		local out_str = key .. "\t" .. obj.name .. "\t"
		out_str = out_str .. obj.population .. "\t" .. obj.date_mod
		print (out_str)
	end
end

client:close()
print ("*** 終了 ***")
-- ----------------------------------------------------
