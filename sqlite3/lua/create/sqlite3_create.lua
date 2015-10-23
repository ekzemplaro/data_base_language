-- ----------------------------------------------------
--	sqlite3_create.lua
--
--					Oct/29/2014
-- ----------------------------------------------------
require	("luasql.sqlite3")
require	("text_manipulate")
require	("sql_manipulate")

print ("*** 開始 ***")

local file_db=arg[1]

print (file_db)

local env = luasql.sqlite3()
local con = env:connect (file_db)

sql_drop_table_proc	(con)
sql_create_table_proc	(con)

sql_insert_proc	(con,"t0711","郡山",78134,"1981-7-15")
sql_insert_proc	(con,"t0712","会津若松",45736,"1981-3-25")
sql_insert_proc	(con,"t0713","白河",51934,"1981-3-21")
sql_insert_proc	(con,"t0714","福島",72382,"1981-8-8")
sql_insert_proc	(con,"t0715","喜多方",61536,"1981-1-5")
sql_insert_proc	(con,"t0716","二本松",48134,"1981-4-12")
sql_insert_proc	(con,"t0717","いわき",67435,"1981-9-17")
sql_insert_proc	(con,"t0718","相馬",82137,"1981-10-21")
sql_insert_proc	(con,"t0719","須賀川",92538,"1981-11-17")

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
