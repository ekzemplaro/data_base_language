// ---------------------------------------------------------------
//	json_delete.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var fs = require("fs");
console.log("*** 開始 ***");
var filename = process.argv[2];
var key_in = process.argv[3];
console.log(filename);
console.log(key_in);
var json_str = fs.readFileSync(filename, 'utf8');
var dict_aa = JSON.parse(json_str);
if (key_in in dict_aa) {
    delete dict_aa[key_in];
    var json_str_out = JSON.stringify(dict_aa);
    fs.writeFile(filename, json_str_out, function (err) {
        if (err) {
            console.log("Error on write: " + err);
        }
        else {
            console.log("File written.");
        }
    });
    //	fs.writeFile (filename,json_str_out);
}
console.log("*** 終了 ***");
// ---------------------------------------------------------------
