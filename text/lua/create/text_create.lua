#! /usr/bin/lua
-- ----------------------------------------------------
--	text_create.lua
--
--				Jun/22/2011
--
-- ----------------------------------------------------
require	('text_manipulate')

-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t2381","名古屋",83175,"1981-5-17")
	dict_aa = dict_append_proc (dict_aa,"t2382","豊橋",47154,"1981-8-9")
	dict_aa = dict_append_proc (dict_aa,"t2383","岡崎",53643,"1981-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2384","一宮",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t2385","蒲郡",86178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t2386","常滑",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t2387","大府",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t2388","瀬戸",57545,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t2389","犬山",45326,"1981-3-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

file_out=arg[1]

dict_aa = data_prepare_proc ()

text_write_proc (file_out,dict_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------

