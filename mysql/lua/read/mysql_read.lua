#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	mysql_read.lua
--
--					Nov/15/2010
-- ----------------------------------------------------
require "luasql.mysql"
require "sql_manipulate"
-- ----------------------------------------------------
print ("*** 開始 ***")

local dbname = "city"
local dbhost = "host_mysql"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

mysql_utf8_proc (con)

sql_display_proc (con)
con:close()
env:close()

print ("*** 終了 ***")

-- ----------------------------------------------------
