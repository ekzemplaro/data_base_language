#! /usr/bin/env jjs
// ------------------------------------------------------------------
//
//	json_create.js
//
//					Jan/05/2017
//
// ------------------------------------------------------------------
load ("/var/www/data_base/common/nashorn_common/file_io.js")
load ("/var/www/data_base/common/nashorn_common/text_manipulate.js")

var file_out=arguments[0]

print	("*** 開始 ***")

var dict_aa = data_prepare_proc ()

var out_str = JSON.stringify (dict_aa)

string_write_proc (file_out,out_str)

print	("*** 終了 ***")
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',36712,'1911-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',15927,'1911-11-15')
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',87541,'1911-5-2')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',17846,'1911-6-22')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',43972,'1911-8-14')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',62518,'1911-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',38271,'1911-3-21')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',58146,'1911-7-26')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',29457,'1911-10-2')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',43873,'1911-12-20')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',51857,'1911-2-7')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',92314,'1911-5-17')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',81475,'1911-6-19')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',62748,'1911-10-14')


	return	dict_aa
}

// ------------------------------------------------------------------
