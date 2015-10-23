-- ----------------------------------------------------
--	postgre_update.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	("luasql.postgres")
require	("text_manipulate")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")

local id_in=  arg[1]
local population_in=0 + arg[2]

print (id_in,population_in)

local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.postgres())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))


sql_update_proc	(con,id_in,population_in)

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
