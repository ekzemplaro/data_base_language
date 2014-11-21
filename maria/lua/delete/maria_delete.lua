#! /usr/bin/lua
-- ----------------------------------------------------
--	maria_delete.lua
--
--					Nov/17/2014
-- ----------------------------------------------------
require	("luasql.mysql")
require	("sql_manipulate")

print ("*** 開始 ***")
local id_in= arg[1]

print (id_in)

local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

sql_delete_proc (con,id_in)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
