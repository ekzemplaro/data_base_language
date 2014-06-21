-- ----------------------------------------------------
--	sqlite3_create.lua
--
--					Jul/16/2011
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

sql_insert_proc	(con,"t0711","郡山",72134,"1981-7-15")
sql_insert_proc	(con,"t0712","会津若松",43736,"1981-3-25")
sql_insert_proc	(con,"t0713","白河",52634,"1981-3-21")
sql_insert_proc	(con,"t0714","福島",72582,"1981-8-8")
sql_insert_proc	(con,"t0715","喜多方",69536,"1981-1-5")
sql_insert_proc	(con,"t0716","二本松",48234,"1981-4-12")
sql_insert_proc	(con,"t0717","いわき",37435,"1981-9-17")
sql_insert_proc	(con,"t0718","相馬",82137,"1981-10-21")
sql_insert_proc	(con,"t0719","須賀川",92132,"1981-11-17")

con:close()
env:close()

print ("*** 終了 ***")
-- ----------------------------------------------------
