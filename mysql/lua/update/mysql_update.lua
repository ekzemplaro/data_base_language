-- ----------------------------------------------------
--	mysql_update.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	("luasql.mysql")
require	("text_manipulate")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")

local id_in=arg[1]
local population_in=0 + arg[2]

print (id_in,population_in)

local dbname = "city"
local dbhost = "host_mysql"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))


sql_update_proc	(con,id_in,population_in)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
