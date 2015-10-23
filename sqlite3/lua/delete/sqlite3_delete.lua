-- ----------------------------------------------------
--	sqlite3_delete.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	("luasql.sqlite3")
require	("sql_manipulate")

print ("*** 開始 ***")
local file_db=arg[1]
local id_in= arg[2]

print (id_in)

local env = luasql.sqlite3()
local con = env:connect (file_db)

sql_delete_proc (con,id_in)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
