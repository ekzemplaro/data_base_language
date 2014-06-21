-- ----------------------------------------------------
--	redis_delete.lua
--
--				Apr/18/2013
--
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]

print (key_in)

local server_host = "host_dbase"
local server_port = 6379

local socket = require('socket')

local client = socket.connect (server_host,server_port)

local command = "del " .. key_in .. "\r\n"
client:send(command)
local ret_0 = client:receive()
print (ret_0)


print ("*** 終了 ***")
-- ----------------------------------------------------
