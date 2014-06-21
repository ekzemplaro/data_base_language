#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	tyrant_update.lua
--
--				Jun/22/2011
--
-- ----------------------------------------------------
require 'Memcached'
require 'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

id_in=arg[1]
population_in=arg[2]

print (id_in)
print (population_in)

local mem = Memcached.Connect('localhost', 1978)

update_proc (mem,id_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
