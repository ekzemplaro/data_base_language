-- ----------------------------------------------------
--	sqlite3_update.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	("luasql.sqlite3")
require	("text_manipulate")
require	("sql_manipulate")

print ("*** 開始 ***")

local file_db=arg[1]
local id_in= arg[2]
local population_in=0 + arg[3]

print (id_in,population_in)

local env = luasql.sqlite3()
local con = env:connect (file_db)

sql_update_proc	(con,id_in,population_in)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
