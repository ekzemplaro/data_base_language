-- ----------------------------------------------------
--	mysql_create.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	("luasql.mysql")
require	("text_manipulate")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")

local dbname = "city"
local dbhost = "host_mysql"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

mysql_utf8_proc	(con)
sql_drop_table_proc	(con)
sql_create_table_proc	(con)

sql_insert_proc	(con,"t3321","岡山",58132,"1981-5-15")
sql_insert_proc	(con,"t3322","倉敷",49137,"1981-2-26")
sql_insert_proc	(con,"t3323","津山",94531,"1981-3-28")
sql_insert_proc	(con,"t3324","玉野",56439,"1981-9-29")
sql_insert_proc	(con,"t3325","笠岡",75638,"1981-1-14")
sql_insert_proc	(con,"t3326","井原",35136,"1981-5-21")
sql_insert_proc	(con,"t3327","総社",81374,"1981-7-5")
sql_insert_proc	(con,"t3328","高梁",23812,"1981-8-9")
sql_insert_proc	(con,"t3329","新見",71534,"1981-4-12")

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
