#! /usr/bin/lua
-- ----------------------------------------------------
--	tyrant_update.lua
--
--					Feb/16/2015
--
-- ----------------------------------------------------
json=require	('json')
require 'text_manipulate'
require 'mcached_manipulate'
-- ----------------------------------------------------
print ("*** 開始 ***")

key_in=arg[1]
population_in=arg[2]

print (key_in)
print (population_in)

local server_host = "host_ubuntu"
local server_port = 1978

mcached_update_proc (server_host,server_port,key_in,population_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
