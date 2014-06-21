#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	json_create.js
//
//						May/27/2011
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var file_out = args[1];

var dict_aa = data_prepare_proc ();

text_manipulate.dict_display_proc (dict_aa);

var out_str = JSON.stringify (dict_aa);

// print (out_str);

text_manipulate.string_write_proc (file_out,out_str);

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',63861,'1953-7-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',28157,'1953-11-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',68491,'1953-5-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',34834,'1953-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',45352,'1953-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',62564,'1953-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',33871,'1953-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',58296,'1953-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',27457,'1953-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',43873,'1953-12-20');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',51857,'1953-2-7');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',98314,'1953-5-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81875,'1953-6-19');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72748,'1953-10-14');


	return	dict_aa;
}

// ------------------------------------------------------------------
