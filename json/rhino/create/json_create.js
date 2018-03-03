#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	json_create.js
//
//					Mar/04/2018
//
// ------------------------------------------------------------------
importPackage (java.io)
importPackage (java.lang)
load ("/var/www/data_base/common/rhino_common/file_io.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

var file_out=arguments[0]

System.err.println ("*** 開始 ***")

var dict_aa = data_prepare_proc ()

var out_str = JSON.stringify (dict_aa)

string_write_proc (file_out,out_str)

System.err.println ("*** 終了 ***")
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',68912,'1951-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',24157,'1951-11-15')
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',68741,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',31754,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',45392,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',62572,'1951-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',38271,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',58146,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',29457,'1951-10-2')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',43873,'1951-12-20')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',51857,'1951-2-7')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',92314,'1951-5-17')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',81475,'1951-6-19')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',62748,'1951-10-14')


	return	dict_aa
}

// ------------------------------------------------------------------
