#! /usr/bin/lua
-- ----------------------------------------------------
--	mcachedb_delete.lua
--
--					Feb/16/2015
--
-- ----------------------------------------------------
require	('mcached_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]

print (key_in)

local server_host = "host_ubuntu1"
local server_port = 21201
mcached_delete_proc (server_host,server_port,key_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
