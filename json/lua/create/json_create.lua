#! /usr/bin/lua
-- ----------------------------------------------------
--	json_create.lua
--
--				Dec/15/2014
--
-- ----------------------------------------------------
require	'text_manipulate'
-- ----------------------------------------------------
function data_prepare_proc ()
dict_aa = {}
dict_aa = dict_append_proc (dict_aa,"t0921","宇都宮",93875,"1981-5-17")
dict_aa = dict_append_proc (dict_aa,"t0922","小山",67254,"1981-8-9")
dict_aa = dict_append_proc (dict_aa,"t0923","佐野",53143,"1981-9-15")
dict_aa = dict_append_proc (dict_aa,"t0924","足利",41829,"1981-3-22")
dict_aa = dict_append_proc (dict_aa,"t0925","日光",86178,"1981-7-11")
dict_aa = dict_append_proc (dict_aa,"t0926","下野",38527,"1981-9-21")
dict_aa = dict_append_proc (dict_aa,"t0927","さくら",49536,"1981-1-4")
dict_aa = dict_append_proc (dict_aa,"t0928","矢板",57243,"1981-9-21")
dict_aa = dict_append_proc (dict_aa,"t0929","真岡",74598,"1981-2-5")
dict_aa = dict_append_proc (dict_aa,"t0930","栃木",26187,"1981-6-27")
dict_aa = dict_append_proc (dict_aa,"t0931","大田原",25943,"1981-5-15")
dict_aa = dict_append_proc (dict_aa,"t0932","鹿沼",28167,"1981-4-17")
dict_aa = dict_append_proc (dict_aa,"t0933","那須塩原",49136,"1981-3-11")
dict_aa = dict_append_proc (dict_aa,"t0934","那須烏山",83215,"1981-6-12")

	return	dict_aa
end
-- ----------------------------------------------------
json = require("json")
print ("*** 開始 ***")
file_out=arg[1]
print (file_out)

io.output (file_out)

dict_aa = data_prepare_proc ()

str_json = json.encode (dict_aa)

io.write (str_json)
-- pf (str_json)

print ("*** 終了 ***")
-- ----------------------------------------------------

