// ------------------------------------------------------------------
//
//	xml_read.ts
//
//						Jul/17/2014
//
// ------------------------------------------------------------------
var fs = require('fs');

console.log(process.env.NODE_PATH);
var xml2js = require('xml2js');

var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');

// ------------------------------------------------------------------
console.log("*** 開始 ***");

//
var file_in = process.argv[2];
console.log(file_in);
var parser = new xml2js.Parser();

fs.readFile(file_in, function (err, data) {
    parser.parseString(data, function (err, result) {
        text_manipulate.dict_display_proc(result);
        console.log("*** 終了 ***");
    });
});
// ------------------------------------------------------------------
