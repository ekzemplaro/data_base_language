#! /usr/bin/coffee
#
#	text_delete.coffee
#
#					Aug/19/2013
#
# -------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
#
console.log "*** 開始 ***\n"
file_text = process.argv[2]
key = process.argv[3]

console.log key

dict_aa=text_manipulate.text_read_proc(file_text)

if key of dict_aa
	delete dict_aa[key]
	text_manipulate.dict_display_proc(dict_aa)
	out_str = text_manipulate.dict_to_str_proc(dict_aa,"\t")
	fs.writeFile(file_text, out_str)
#
console.log "*** 終了 ***\n"
# -------------------------------------------------------------
