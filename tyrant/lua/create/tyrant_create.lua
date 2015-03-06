#! /usr/bin/lua
-- ----------------------------------------------------
--	tyrant_create.lua
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

	dict_aa = dict_append_proc (dict_aa,"t4761","那覇",83125,"1981-5-17")
	dict_aa = dict_append_proc (dict_aa,"t4762","宜野湾",87254,"1981-8-9")
	dict_aa = dict_append_proc (dict_aa,"t4763","石垣",53643,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t4764","浦添",41389,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t4765","名護",86172,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t4766","糸満",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t4767","沖縄",49516,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t4768","豊見城",57842,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t4769","うるま",45326,"1981-3-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")


dict_aa = data_prepare_proc ()

local server_host = "host_ubuntu1"
local server_port = 1978

dict_to_mcached_proc (server_host,server_port,dict_aa)


print ("*** 終了 ***")
-- ----------------------------------------------------

