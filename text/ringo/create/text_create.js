#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	text_create.js
//
//						Dec/27/2013
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_out = args[1];

var dict_aa = data_prepare_proc ();
text_manipulate.dict_display_proc (dict_aa);
text_manipulate.text_write_proc (file_out,dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',91865,'1953-8-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',23157,'1953-10-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',68741,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',38714,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',42358,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',69142,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',36281,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',58246,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',27451,'1953-10-2');

	return	dict_aa;
}

// ------------------------------------------------------------------
