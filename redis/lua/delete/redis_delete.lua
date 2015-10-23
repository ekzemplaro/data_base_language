-- ----------------------------------------------------
--	redis_delete.lua
--
--				Feb/13/2015
--
-- ----------------------------------------------------
require	('redis_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]

print (key_in)

local server_host = "host_dbase"
local server_port = 6379

redis_delete_proc (server_host,server_port,key_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
