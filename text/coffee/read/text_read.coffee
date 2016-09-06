#! /usr/bin/coffee
#
#	text_read.coffee
#
#					Sep/06/2016
#
# -------------------------------------------------------------
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
#
console.error "*** 開始 ***"
file_in = process.argv[2]

dict_aa=text_manipulate.text_read_proc(file_in)
text_manipulate.dict_display_proc(dict_aa)

console.error "*** 終了 ***"
# -------------------------------------------------------------
