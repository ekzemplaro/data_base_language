#! /usr/bin/coffee
# ---------------------------------------------------------------
#
#	xlsx_create.coffee
#
#					Dec/12/2014
#
# ---------------------------------------------------------------
fs = require("fs")
coffee_common = '/var/www/data_base/common/node_common'
text_manipulate=require (coffee_common + '/text_manipulate')
xlsx_manipulate=require (coffee_common + '/xlsx_manipulate')

xlsx = require('node-xlsx')

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2971','奈良',42136,'1954-5-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2972','大和高田',39572,'1954-6-8')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2973','大和郡山',67149,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2974','天理',31864,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2975','橿原',49358,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2976','桜井',65792,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2977','五條',38251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2978','御所',48695,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2979','生駒',85723,'1954-10-2')
	
	return	dict_aa

# ---------------------------------------------------------------
console.log "*** 開始 ***"

xlsx_file = process.argv[2]

dict_aa = data_prepare_proc()

xlsx_manipulate.xlsx_write_proc(xlsx_file,dict_aa)

console.log "*** 終了 ***"

# ---------------------------------------------------------------
