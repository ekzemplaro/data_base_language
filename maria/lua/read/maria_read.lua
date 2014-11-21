#! /usr/bin/lua
-- ----------------------------------------------------
--	maria_read.lua
--
--					Nov/17/2014
-- ----------------------------------------------------
require "luasql.mysql"
require "sql_manipulate"
-- ----------------------------------------------------
print ("*** 開始 ***")

local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

sql_display_proc (con)
con:close()
env:close()

print ("*** 終了 ***")

-- ----------------------------------------------------
