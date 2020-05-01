// ---------------------------------------------------------------
//	text_delete.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var text_manipulate = require("/var/www/data_base/common/typescript_common/text_manipulate");
// ---------------------------------------------------------------
console.error("*** 開始 ***");
//
var file_txt = process.argv[2];
var key = process.argv[3];
console.log(file_txt);
console.log(key);
var dict_aa = text_manipulate.text_read_proc(file_txt);
if (key in dict_aa) {
    delete dict_aa[key];
    text_manipulate.text_write_proc(file_txt, dict_aa);
}
console.error("*** 終了 ***");
// ---------------------------------------------------------------
