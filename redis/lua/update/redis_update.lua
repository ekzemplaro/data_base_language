-- ----------------------------------------------------
--	redis_update.lua
--
--				Feb/13/2015
--
-- ----------------------------------------------------
require	('text_manipulate')
require	('redis_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

local key_in=arg[1]
local population_in= 0 + arg[2]

print (key_in,population_in)

local server_host = "host_dbase"
local server_port = 6379

redis_update_proc (server_host,server_port,key_in,population_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
