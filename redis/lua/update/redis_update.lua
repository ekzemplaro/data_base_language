-- ----------------------------------------------------
--	redis_update.lua
--
--				Apr/18/2013
--
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]
local population_in= 0 + arg[2]

print (key_in,population_in)

local server_host = "host_dbase"
local server_port = 6379

local socket = require('socket')

local client = socket.connect (server_host,server_port)

local command = "get " .. key_in .. "\r\n"
client:send(command)
local ret_0 = client:receive()
if (ret_0 ~= "$-1") then
	local ret_1 = client:receive()
	print (ret_1)
	json = require("json")
	local obj = json.decode(ret_1)
	obj.population=population_in
	today = (os.date ("*t").year) .. "-" ..
		(os.date ("*t").month) .. "-" ..
		(os.date ("*t").day)
	obj.date_mod=today
	str_json = json.encode (obj)
	print (str_json)
	command = "set " .. key_in .. " " .. str_json .. "\r\n"
	client:send(command)
	ret_0 = client:receive()
	print (ret_0)
end

print ("*** 終了 ***")
-- ----------------------------------------------------
