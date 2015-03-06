#! /usr/bin/lua
-- ----------------------------------------------------
--	mcached_delete.lua
--
--				Feb/13/2015
--
-- ----------------------------------------------------
require	('mcached_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]

print (key_in)

local server_host = "localhost"
local server_port = 11211

mcached_delete_proc (server_host,server_port,key_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
