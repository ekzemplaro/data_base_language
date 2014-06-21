#! /usr/bin/coffee
# ------------------------------------------------------------------
#
#	xml_read.coffee
#
#						Jul/19/2012
#
# ------------------------------------------------------------------
fs = require('fs')
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ------------------------------------------------------------------
console.log	"*** 開始 ***"

file_in = process.argv[2]

console.log file_in

parser = new xml2js.Parser()

fs.readFile file_in, (err, data) ->
	console.log	("*** start reading ***")
	parser.parseString(data)

parser.on 'end', (result) ->
	text_manipulate.dict_display_proc (result)
	console.log	("*** 終了 ***")

# ------------------------------------------------------------------
