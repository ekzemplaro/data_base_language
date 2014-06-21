#! /usr/bin/coffee
# ---------------------------------------------------------------
#	json_update.coffee
#
#					Mar/12/2012
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
#
console.log "*** 開始 ***"
filename=process.argv[2]
key_in=process.argv[3]
population_in=process.argv[4]

console.log filename
console.log key_in + "\t" + population_in

json_str = fs.readFileSync(filename)
dict_aa = JSON.parse json_str

if key_in of dict_aa
	dict_bb = text_manipulate.dict_update_proc(dict_aa,key_in,population_in)
	json_str = JSON.stringify(dict_bb)
	fs.writeFile(filename,json_str)
#
console.log "*** 終了 ***"

# ---------------------------------------------------------------
