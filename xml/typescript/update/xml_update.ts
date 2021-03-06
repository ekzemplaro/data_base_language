// ------------------------------------------------------------------
//
//	xml_update.ts
//
//						Sep/16/2015
//
// ------------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var fs = require('fs'),
    xml2js = require('xml2js');
var text_manipulate =
	require('/var/www/data_base/common/typescript_common/text_manipulate');
var xml_manipulate =
	require ("/var/www/data_base/common/typescript_common/xml_manipulate");

// ------------------------------------------------------------------
console.log	("*** 開始 ***");

var file_xml:string = process.argv[2];
var id_in:string = process.argv[3];
var population_in:number = process.argv[4];

console.log (id_in + "\t" + population_in);

var parser = new xml2js.Parser();

fs.readFile(file_xml, function(err, data) {
	console.log	("*** start reading ***");
	parser.parseString(data);
});

parser.on('end', function(result) {

	var dict_aa = text_manipulate.dict_update_proc
			(result,id_in,population_in);

	var out_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	fs.writeFile(file_xml,out_str);

	console.log	("*** 終了 ***");
});

// ------------------------------------------------------------------
