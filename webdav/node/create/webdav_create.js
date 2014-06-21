#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	webdav_create.js
//
//					Jul/20/2012
//
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//

var dict_aa = data_prepare_proc ();
var json_str = JSON.stringify(dict_aa);

http_manipulate.put_proc ('host_dbase',3004,'/city/tokyo.json',json_str);

console.log ("*** 終了 ***");


// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1351','八王子',75214,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1352','立川',31587,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1353','武蔵野',65278,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1354','三鷹',38695,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1355','青梅',42158,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1356','府中',67892,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1357','昭島',38751,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1358','調布',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1359','町田',26547,'1950-10-2');


	return	dict_aa;
}	

// ---------------------------------------------------------------
