#! /usr/bin/nodejs
// ------------------------------------------------------------------
//
//	xml_delete.js
//
//						Dec/26/2016
//
// ------------------------------------------------------------------
var fs = require('fs')
var xml2js = require('xml2js')
var text_manipulate =
	require('/var/www/data_base/common/node_common/text_manipulate')
var xml_manipulate =
	require ("/var/www/data_base/common/node_common/xml_manipulate")

// ------------------------------------------------------------------
console.log	("*** 開始 ***")

const file_xml = process.argv[2]
const key_in = process.argv[3]

console.log (key_in)

var parser = new xml2js.Parser()

fs.readFile(file_xml, function(err, data) {
	console.log	("*** start reading ***")
	parser.parseString(data)
})

parser.on('end', function(result) {

	delete result[key_in]

	const out_str = xml_manipulate.dict_to_xml_proc (result)

	fs.writeFile (file_xml,out_str,function (err)
		{
		if (err)
			{
			console.log("Error on write: " + err)
			}
		})

	console.log	("*** 終了 ***")
})

// ------------------------------------------------------------------
