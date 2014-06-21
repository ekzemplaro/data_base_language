#! /usr/bin/coffee
# ---------------------------------------------------------------
#	json_read.coffee
#
#					Mar/12/2012
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log ("*** 開始 ***")

filename=process.argv[2]

console.log (filename)

json_str = fs.readFileSync (filename)

dict_aa = JSON.parse (json_str)

text_manipulate.dict_display_proc (dict_aa)

console.log ("*** 終了 ***")
# ---------------------------------------------------------------

