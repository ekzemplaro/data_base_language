#! /usr/bin/lua
-- ----------------------------------------------------
--	csv_create.lua
--
--				Jul/02/2011
--
-- ----------------------------------------------------
require	('text_manipulate')

-- ----------------------------------------------------
function data_prepare_proc ()
	doc_aa = {}

	doc_aa["t1271"] = {name= "千葉",population=23654,date_mod="1981-3-25"}
	doc_aa["t1272"] = {name= "勝浦",population=78938,date_mod="1981-7-12"}
	doc_aa["t1273"] = {name= "市原",population=64243,date_mod="1981-8-24"}
	doc_aa["t1274"] = {name= "流山",population=24975,date_mod="1981-1-23"}
	doc_aa["t1275"] = {name= "八千代",population=48186,date_mod="1981-2-11"}
	doc_aa["t1276"] = {name= "我孫子",population=52576,date_mod="1981-5-15"}
	doc_aa["t1277"] = {name= "鴨川",population=76385,date_mod="1981-6-18"}
	doc_aa["t1278"] = {name= "銚子",population=18927,date_mod="1981-8-8"}
	doc_aa["t1279"] = {name= "市川",population=43829,date_mod="1981-9-9"}

	return	doc_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

file_out=arg[1]

doc_aa = data_prepare_proc ()

csv_write_proc (file_out,doc_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------

