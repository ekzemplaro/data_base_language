#! /usr/bin/nodejs
// ------------------------------------------------------------------
//
//	xml_to_json.js
//
//						Oct/31/2012
//
// ------------------------------------------------------------------
var fs = require('fs');

console.log(process.env.NODE_PATH);
var xml2js = require('xml2js');

// ------------------------------------------------------------------
console.log ("*** 開始 ***");
//
var file_in=process.argv[2];
var file_json=process.argv[3];
console.log (file_in);
console.log (file_json);
var parser = new xml2js.Parser();

fs.readFile(file_in, function(err, data) {
    parser.parseString(data, function (err, result)
	{
	var json_str = JSON.stringify(result);

	fs.writeFile (file_json,json_str);
	console.log ("*** 終了 ***");
	});
});


// ------------------------------------------------------------------
