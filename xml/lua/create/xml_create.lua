-- ----------------------------------------------------
--	xml_create.lua
--
--				May/27/2011
--
-- ----------------------------------------------------
require	('text_manipulate')
require	('xml_manipulate')
-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa["t2261"] = {name= "静岡",population=23671,date_mod="1981-3-25"}
	dict_aa["t2262"] = {name= "浜松",population=78931,date_mod="1981-7-12"}
	dict_aa["t2263"] = {name= "沼津",population=64523,date_mod="1981-8-24"}
	dict_aa["t2264"] = {name= "三島",population=24865,date_mod="1981-1-23"}
	dict_aa["t2265"] = {name= "富士",population=48316,date_mod="1981-2-11"}
	dict_aa["t2266"] = {name= "熱海",population=52946,date_mod="1981-5-15"}
	dict_aa["t2267"] = {name= "富士宮",population=76385,date_mod="1981-6-18"}
	dict_aa["t2268"] = {name= "藤枝",population=18927,date_mod="1981-8-8"}
	dict_aa["t2269"] = {name= "御殿場",population=43829,date_mod="1981-9-9"}
	dict_aa["t2270"] = {name= "島田",population=82654,date_mod="1981-7-12"}

	return	dict_aa
end
-- ----------------------------------------------------
require("LuaXml")

print ("*** 開始 ***")
file_xml=arg[1]
print(file_xml)
--
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
xml_str = dict_to_xml_proc (dict_aa)
-- print (xml_str)

io.output (file_xml)
io.write (xml_str)
-- xml.save (dict_aa,"tmp01.xml")
print ("*** 終了 ***")
-- ----------------------------------------------------
