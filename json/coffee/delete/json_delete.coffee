#! /usr/bin/coffee
# ---------------------------------------------------------------
#	json_delete.coffee
#
#					Aug/19/2013
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
#
console.log "*** 開始 ***"
filename=process.argv[2]
key_in=process.argv[3]

console.log filename
console.log key_in

json_str = fs.readFileSync(filename)
dict_aa = JSON.parse json_str

if key_in of dict_aa
	console.log "*** key exists ***"
	delete dict_aa[key_in]
	json_str = JSON.stringify(dict_aa)
	fs.writeFile(filename,json_str)
#
console.log "*** 終了 ***"

# ---------------------------------------------------------------
