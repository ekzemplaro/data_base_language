#! /usr/bin/coffee
# ---------------------------------------------------------------
#
#	xlsx_delete.js
#
#					Aug/08/2013
#
# ---------------------------------------------------------------
fs = require('fs')
node_common = '/var/www/data_base/common/node_common'

text_manipulate=require (node_common + '/text_manipulate')
xlsx_manipulate=require (node_common + '/xlsx_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

xlsx_file = process.argv[2]
key=process.argv[3]

console.log xlsx_file
console.log key

dict_aa = xlsx_manipulate.xlsx_read_proc(xlsx_file)

if key of dict_aa
	delete dict_aa[key]
	xlsx_manipulate.xlsx_write_proc(xlsx_file,dict_aa)

console.log "*** 終了 ***"
# ---------------------------------------------------------------
