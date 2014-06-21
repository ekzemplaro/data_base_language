#! /usr/bin/coffee
#
#	csv_read.coffee
#
#					Mar/12/2012
#
# -------------------------------------------------------------
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
#
console.log "*** 開始 ***\n"
file_in = process.argv[2]

dict_aa=text_manipulate.csv_read_proc(file_in)
text_manipulate.dict_display_proc(dict_aa)

console.log "*** 終了 ***\n"
# -------------------------------------------------------------
