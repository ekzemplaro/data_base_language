-- ----------------------------------------------------
--	postgre_read.lua
--
--					Dec/22/2010
-- ----------------------------------------------------
require "luasql.postgres"
require "sql_manipulate"
-- ----------------------------------------------------
print ("*** 開始 ***")

local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.postgres())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

sql_display_proc (con)

con:close()
env:close()

print ("*** 終了 ***")

-- ----------------------------------------------------
