var fs = require("fs");
var text_manipulate = require("/var/www/data_base/common/typescript_common/text_manipulate");
var xml_manipulate = require("/var/www/data_base/common/typescript_common/xml_manipulate");
// ---------------------------------------------------------------
console.log("*** 開始 ***");
var filename = process.argv[2];
var dict_aa = data_prepare_proc();
var out_str = xml_manipulate.dict_to_xml_proc(dict_aa);
fs.writeFile(filename, out_str, function (err) {
    if (err) {
        console.log("Error on write: " + err);
    }
    else {
        console.log("File written.");
    }
    console.log("*** 終了 ***");
});
// ---------------------------------------------------------------
function data_prepare_proc() {
    var dict_aa = new Object();
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2261', '静岡', 84263, '2012-3-24');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2262', '浜松', 13597, '2012-8-15');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2263', '沼津', 98341, '2012-7-2');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2264', '三島', 39624, '2012-2-22');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2265', '富士', 48912, '2012-8-14');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2266', '熱海', 65174, '2012-9-12');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2267', '富士宮', 78251, '2012-3-21');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2268', '藤枝', 52436, '2012-7-26');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2269', '御殿場', 74827, '2012-5-8');
    dict_aa = text_manipulate.dict_append_proc(dict_aa, 't2270', '島田', 82745, '2012-10-21');
    return dict_aa;
}
// ---------------------------------------------------------------
