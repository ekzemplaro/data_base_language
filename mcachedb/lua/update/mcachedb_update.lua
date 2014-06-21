#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	mcachedb_update.lua
--
--				Apr/02/2013
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

local mem = Memcached.Connect('localhost', 21201)

update_proc (mem,id_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
