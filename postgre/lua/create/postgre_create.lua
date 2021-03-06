-- ----------------------------------------------------
--	postgre_create.lua
--
--					Dec/15/2014
-- ----------------------------------------------------
require	("luasql.postgres")
require	("text_manipulate")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")


local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.postgres())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

sql_drop_table_proc	(con)
sql_create_table_proc	(con)

sql_insert_proc	(con,"t3461","広島",51932,"1981-5-15")
sql_insert_proc	(con,"t3462","福山",72851,"1981-4-18")
sql_insert_proc	(con,"t3463","東広島",42186,"1981-3-12")
sql_insert_proc	(con,"t3464","呉",82137,"1981-7-21")
sql_insert_proc	(con,"t3465","尾道",92675,"1981-6-8")
sql_insert_proc	(con,"t3466","竹原",62814,"1981-8-19")
sql_insert_proc	(con,"t3467","三次",25478,"1981-10-22")
sql_insert_proc	(con,"t3468","大竹",32918,"1981-11-5")
sql_insert_proc	(con,"t3469","府中",83147,"1981-9-17")

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
