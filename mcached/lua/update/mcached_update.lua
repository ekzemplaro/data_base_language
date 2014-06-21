#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	mcached_update.lua
--
--				Sep/16/2010
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

local mem = Memcached.Connect('localhost', 11211)

update_proc (mem,id_in)

print ("*** 終了 ***")
-- ----------------------------------------------------
