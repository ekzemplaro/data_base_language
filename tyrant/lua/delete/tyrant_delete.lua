#! /usr/bin/lua
-- ----------------------------------------------------
--	tyrant_delete.lua
--
--					Feb/16/2015
--
-- ----------------------------------------------------
require	('mcached_manipulate')

-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]

print (key_in)

local server_host = "host_ubuntu"
local server_port = 1978
mcached_delete_proc (server_host,server_port,key_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
