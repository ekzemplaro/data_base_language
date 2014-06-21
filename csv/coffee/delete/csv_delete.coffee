#! /usr/bin/coffee
#
#	csv_delete.coffee
#
#					Mar/12/2012
#
# -------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
#
console.log "*** 開始 ***\n"
file_text = process.argv[2]
id_in = process.argv[3]

console.log (id_in)

dict_aa=text_manipulate.csv_read_proc(file_text)

delete dict_aa[id_in]

text_manipulate.dict_display_proc(dict_aa)
out_str = text_manipulate.dict_to_str_proc(dict_aa,",")
fs.writeFile(file_text, out_str)

console.log "*** 終了 ***\n"
# -------------------------------------------------------------
