#! /usr/bin/coffee
# ------------------------------------------------------------------
#
#	xml_delete.coffee
#
#						Jul/19/2012
#
# ------------------------------------------------------------------
fs = require('fs')
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
# ------------------------------------------------------------------
console.log	"*** 開始 ***"

file_xml = process.argv[2]
id_in = process.argv[3]

console.log file_xml
console.log id_in


parser = new xml2js.Parser()

fs.readFile file_xml, (err, data) ->
	console.log	("*** start reading ***")
	parser.parseString(data)

parser.on 'end', (result) ->
	delete result[id_in]
	text_manipulate.dict_display_proc(result)
	out_str = xml_manipulate.dict_to_xml_proc(result)
	fs.writeFile(file_xml,out_str)
	console.log	"*** 終了 ***"

# ------------------------------------------------------------------
