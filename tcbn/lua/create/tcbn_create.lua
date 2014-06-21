-- ----------------------------------------------------
--	tcbn_update.lua
--
--					Sep/14/2010
-- ----------------------------------------------------
function create_proc (bdb,id_in,name_in,population_in,date_mod_in)
	json = require("json")
	obj = { id=id_in, name=name_in, 
		population=population_in, date_mod=date_mod_in}
	str_json = json.encode (obj)
	bdb:put (id_in,str_json)
end
-- ----------------------------------------------------
print ("*** 開始 ***")
file_in=arg[1]
id_in=arg[2]

require("tokyocabinet")

-- create the object
bdb = tokyocabinet.bdbnew()

-- open the database
if not bdb:open(file_in, bdb.OWRITER + bdb.OCREAT) then
	ecode = bdb:ecode()
	print("open error: " .. bdb:errmsg(ecode))
end

create_proc (bdb,"t0831","水戸",45726,"1981-4-12")
create_proc (bdb,"t0832","古河",28135,"1981-5-21")
create_proc (bdb,"t0833","結城",76973,"1981-6-15")
create_proc (bdb,"t0834","土浦",14584,"1981-7-8")
create_proc (bdb,"t0835","牛久",82378,"1981-10-14")
create_proc (bdb,"t0836","取手",91327,"1981-9-26")
create_proc (bdb,"t0837","つくば",54321,"1981-8-27")
create_proc (bdb,"t0838","日立",76846,"1981-1-15")
create_proc (bdb,"t0839","守谷",65327,"1981-3-12")

-- close the database
if not bdb:close() then
	ecode = bdb:ecode()
	print("close error: " .. bdb:errmsg(ecode))
end

print ("*** 終了 ***")
-- ----------------------------------------------------
