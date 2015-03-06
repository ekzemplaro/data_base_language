#! /usr/bin/lua
-- ----------------------------------------------------
--	mcached_create.lua
--
--				Feb/16/2015
--
-- ----------------------------------------------------
json=require	('json')
require	('text_manipulate')
require	('mcached_manipulate')

-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t1731","金沢",83275,"1981-5-17")
	dict_aa = dict_append_proc (dict_aa,"t1732","輪島",47954,"1981-8-9")
	dict_aa = dict_append_proc (dict_aa,"t1733","小松",58743,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t1734","七尾",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t1735","珠洲",86178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t1736","加賀",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1737","羽咋",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t1738","かほく",27841,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t1739","白山",45386,"1981-3-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

dict_aa = data_prepare_proc ()

local server_host = "localhost"
local server_port = 11211

dict_to_mcached_proc (server_host,server_port,dict_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------

