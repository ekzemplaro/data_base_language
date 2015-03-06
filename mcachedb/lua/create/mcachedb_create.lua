#! /usr/bin/lua
-- ----------------------------------------------------
--	mcachedb_create.lua
--
--					Feb/16/2015
--
-- ----------------------------------------------------
json=require	('json')
require	('text_manipulate')
require	('mcached_manipulate')
-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t1521","新潟",83275,"1981-5-17")
	dict_aa = dict_append_proc (dict_aa,"t1522","長岡",47954,"1981-8-9")
	dict_aa = dict_append_proc (dict_aa,"t1523","新発田",58743,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t1524","上越",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t1525","糸魚川",86178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t1526","加茂",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1527","三条",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t1528","佐渡",27841,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t1529","柏崎",45386,"1981-3-18")
	dict_aa = dict_append_proc (dict_aa,"t1530","村上",93871,"1981-9-24")
	dict_aa = dict_append_proc (dict_aa,"t1531","十日町",57249,"1981-2-8")
	dict_aa = dict_append_proc (dict_aa,"t1532","五泉",34172,"1981-11-15")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

dict_aa = data_prepare_proc ()

local server_host = "host_ubuntu1"
local server_port = 21201

dict_to_mcached_proc (server_host,server_port,dict_aa)


print ("*** 終了 ***")
-- ----------------------------------------------------

