#! /usr/bin/coffee
#
#					Oct/28/2011
#
# -------------------------------------------------------------
fs = require('fs')
# -------------------------------------------------------------
console.log "*** 開始 ***\n"
file_in = process.argv[2]
file_json = process.argv[3]

data_aa = new Object
data = fs.readFileSync (file_in)
lines_in = ("" + data).split ("\n")
for line in lines_in
	if (3 < line.length)
		rr = line.split (" ")
		key = "t" + rr[0]
		value = new Object
		value["name"] = rr[1]
		value["paper"] = 0
		value["sound"] = 0
		value["url_city"] = "http://"
		data_aa[key] = value
#
json_str = JSON.stringify data_aa
fs.writeFile(file_json,json_str)
console.log "*** 終了 ***\n"
# -------------------------------------------------------------
