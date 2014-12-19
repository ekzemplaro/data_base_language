#! /usr/bin/lua
-- ----------------------------------------------------
--	ftp_create.lua
--
--					Dec/19/2014
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'
-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t0361","盛岡",93462,"1981-3-27")
	dict_aa = dict_append_proc (dict_aa,"t0362","久慈",67154,"1981-4-9")
	dict_aa = dict_append_proc (dict_aa,"t0363","二戸",53683,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t0364","宮古",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t0365","遠野",26178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t0366","八幡平",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t0367","大船渡",49536,"1981-1-14")
	dict_aa = dict_append_proc (dict_aa,"t0368","一関",57142,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t0369","花巻",32681,"1981-5-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

local ftp = require ("socket.ftp")

local resp = {}

url="ftp://scott:tiger@host_dbase/city/iwate.json"

dict_aa = data_prepare_proc ()

dict_display_proc (dict_aa)

str_json = json.encode (dict_aa)

ee = ftp.put (url,str_json)

print ("*** 終了 ***")
-- ----------------------------------------------------

