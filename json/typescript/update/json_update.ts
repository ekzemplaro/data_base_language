// ---------------------------------------------------------------
//	json_update.ts
//
//					Sep/16/2015
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/typescript_common/text_manipulate');

//
console.log ("*** 開始 ***");
var filename:string = process.argv[2];
var id_in:string = process.argv[3];
var population_in:number = process.argv[4];

console.log (filename);
console.log (id_in + "\t" + population_in);

var json_str:string = fs.readFileSync(filename,'utf8');
var dict_aa = JSON.parse (json_str);

var dict_bb = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

var json_str_out:string = JSON.stringify(dict_bb);

fs.writeFile (filename,json_str_out);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
