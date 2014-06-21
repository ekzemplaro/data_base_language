#! /usr/bin/coffee
# ---------------------------------------------------------------
#
#	xlsx_read.coffee
#
#					Aug/19/2013
#
# ---------------------------------------------------------------
fs = require('fs')
coffee_common = '/var/www/data_base/common/coffee_common'

text_manipulate=require (coffee_common + '/text_manipulate')
xlsx_manipulate=require (coffee_common + '/xlsx_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

xlsx_file = process.argv[2]

dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

text_manipulate.dict_display_proc (dict_aa)

console.log "*** 終了 ***"
# ---------------------------------------------------------------
