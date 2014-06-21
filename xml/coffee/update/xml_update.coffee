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
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
# ------------------------------------------------------------------
console.log	"*** 開始 ***"

file_xml = process.argv[2]
id_in = process.argv[3]
population_in = process.argv[4]

console.log file_xml
console.log id_in + "\t" + population_in


parser = new xml2js.Parser()

fs.readFile file_xml, (err, data) ->
	console.log	("*** start reading ***")
	parser.parseString(data)

parser.on 'end', (result) ->
	dict_aa=text_manipulate.dict_update_proc(result,id_in,population_in)
	text_manipulate.dict_display_proc (result)
	out_str = xml_manipulate.dict_to_xml_proc(dict_aa)
	fs.writeFile(file_xml,out_str)
	console.log	"*** 終了 ***"

# ------------------------------------------------------------------
