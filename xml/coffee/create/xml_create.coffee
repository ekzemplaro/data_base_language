#! /usr/bin/coffee
# ---------------------------------------------------------------
#	xml_create.coffee
#
#					Oct/22/2014
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate")
xml_manipulate=require ("/var/www/data_base/common/coffee_common/xml_manipulate")

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2261','静岡',74863,'1954-5-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2262','浜松',29157,'1954-6-25')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2263','沼津',36741,'1954-7-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2264','三島',91724,'1954-2-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2265','富士',48352,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2266','熱海',69254,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2267','富士宮',78251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2268','藤枝',57436,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2269','御殿場',24837,'1954-11-8')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2270','島田',91845,'1954-12-21')

	return	dict_aa

# ---------------------------------------------------------------
console.log "*** 開始 ***"
#

fs = require("fs")

filename=process.argv[2]

dict_aa = data_prepare_proc()

out_str = xml_manipulate.dict_to_xml_proc(dict_aa)

fs.writeFile filename,out_str, (err) ->
	if err
		console.log("Error on write: " + err)
	else
		console.log("File written.")

# console.log (out_str)
console.log "*** 終了 ***"


# ---------------------------------------------------------------
