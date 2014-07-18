// ---------------------------------------------------------------
//	xml_create.ts
//
//					Jul/17/2014
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require("/var/www/data_base/common/node_common/text_manipulate");
var xml_manipulate = require("/var/www/data_base/common/node_common/xml_manipulate");

// ---------------------------------------------------------------
console.log("*** 開始 ***");

var filename = process.argv[2];

var dict_aa = data_prepare_proc();

var out_str = xml_manipulate.dict_to_xml_proc(dict_aa);

fs.writeFile(filename, out_str, function (err) {
    if (err) {
        console.log("Error on write: " + err);
    } else {
        console.log("File written.");
    }

    // console.log (out_str);
    console.log("*** 終了 ***");
});

// ---------------------------------------------------------------
function data_prepare_proc() {
    var dict_aa = new Object();

    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2261', '静岡', 51863, '1950-8-14');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2262', '浜松', 26197, '1950-10-25');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2263', '沼津', 59341, '1950-7-2');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2264', '三島', 38924, '1950-2-22');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2265', '富士', 49712, '1950-8-14');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2266', '熱海', 65174, '1950-9-12');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2267', '富士宮', 78251, '1950-3-21');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2268', '藤枝', 51436, '1950-7-26');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2269', '御殿場', 74827, '1950-11-8');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2270', '島田', 92845, '1950-12-21');

    return dict_aa;
}
// ---------------------------------------------------------------
