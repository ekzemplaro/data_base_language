#! /usr/bin/coffee
#
#	text_create.coffee
#
#					Oct/18/2011
# -------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2381','名古屋',65724,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2382','豊橋',57938,'1954-2-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2383','岡崎',29741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2384','一宮',38764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2385','蒲郡',49871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2386','常滑',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2387','大府',31251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2388','瀬戸',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2389','犬山',26257,'1954-10-2')

	return dict_aa
# -------------------------------------------------------------
#
console.log "*** 開始 ***\n"
file_out = process.argv[2]
console.log file_out
dict_aa = data_prepare_proc()
text_manipulate.dict_display_proc(dict_aa)
out_str = text_manipulate.dict_to_str_proc(dict_aa,"\t")
fs.writeFile(file_out, out_str)
#
console.log "*** 終了 ***\n"
# -------------------------------------------------------------
