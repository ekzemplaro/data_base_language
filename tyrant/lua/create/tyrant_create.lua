#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	tyrant_create.lua
--
--				Jun/22/2011
--
-- ----------------------------------------------------
require 'Memcached'
require 'kvalue_manipulate'
require 'text_manipulate'

-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t4761","那覇",83175,"1981-5-17")
	dict_aa = dict_append_proc (dict_aa,"t4762","宜野湾",47154,"1981-8-9")
	dict_aa = dict_append_proc (dict_aa,"t4763","石垣",53643,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t4764","浦添",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t4765","名護",86178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t4766","糸満",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t4767","沖縄",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t4768","豊見城",57545,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t4769","うるま",45326,"1981-3-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

local mem = Memcached.Connect('localhost', 1978)

dict_aa = data_prepare_proc ()

for str_key in pairs (dict_aa)
	do
	name = dict_aa[str_key]["name"]
	population = dict_aa[str_key]["population"]
	date_mod = dict_aa[str_key]["date_mod"]
	record_out_proc (mem,str_key,name,population,date_mod)
	end

print ("*** 終了 ***")
-- ----------------------------------------------------

