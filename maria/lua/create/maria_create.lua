#! /usr/bin/lua
-- ----------------------------------------------------
--	maria_create.lua
--
--					Nov/17/2014
-- ----------------------------------------------------
require	("luasql.mysql")
require	("text_manipulate")
require	("sql_manipulate")
-- ----------------------------------------------------
print ("*** 開始 ***")

local dbname = "city"
local dbhost = "localhost"
local dbuser = "scott"
local dbpass = "tiger"

local env = assert(luasql.mysql())
local con = assert(env:connect(dbname, dbuser, dbpass, dbhost))

sql_drop_table_proc	(con)
sql_create_table_proc	(con)

sql_insert_proc	(con,"t3321","岡山",578432,"1981-9-15")
sql_insert_proc	(con,"t3322","倉敷",429637,"1981-8-26")
sql_insert_proc	(con,"t3323","津山",984531,"1981-7-28")
sql_insert_proc	(con,"t3324","玉野",576439,"1981-3-29")
sql_insert_proc	(con,"t3325","笠岡",745638,"1981-1-14")
sql_insert_proc	(con,"t3326","井原",352186,"1981-5-21")
sql_insert_proc	(con,"t3327","総社",813974,"1981-10-5")
sql_insert_proc	(con,"t3328","高梁",238416,"1981-8-9")
sql_insert_proc	(con,"t3329","新見",721534,"1981-4-12")

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
