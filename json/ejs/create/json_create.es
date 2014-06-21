#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	json_create.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ejs_common/text_manipulate.es')
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',86157,'1952-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',27648,'1952-11-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',68491,'1952-5-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',34834,'1952-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',45352,'1952-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',67243,'1952-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',38291,'1952-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',58246,'1952-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',27457,'1952-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',43873,'1952-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',51857,'1952-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',94384,'1952-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81875,'1952-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72748,'1952-10-14')


	return	dict_aa
}

// ------------------------------------------------------------------
print	("*** 開始 ***")
var file_out = App.args[1]

var dict_aa = data_prepare_proc ()

text_manipulate.dict_display_proc (dict_aa)

var out_str = JSON.stringify (dict_aa)

// print (out_str)

text_manipulate.string_write_proc (file_out,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
