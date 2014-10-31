#! /usr/bin/lua
-- ----------------------------------------------------
--	sqlite3_read.lua
--
--					Oct/29/2014
-- ----------------------------------------------------
require	("luasql.sqlite3")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")
local file_db=arg[1]

local env = luasql.sqlite3()
local con = env:connect (file_db)

sql_display_proc (con)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
