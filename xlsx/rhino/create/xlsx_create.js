#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_create.js
					Oct/09/2015

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js")

// ----------------------------------------------------------------
print ("*** 開始 ***")

var xlsx_file = arguments[0]

var dict_aa = data_prepare_proc ()

xlsx_write_proc (xlsx_file,dict_aa)

print ("*** 終了 ***")  
  
// ----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t2971','奈良',483157,'1951-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2972','大和高田',392146,'1951-4-25')
	dict_aa = dict_append_proc (dict_aa,'t2973','大和郡山',529648,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t2974','天理',387126,'1951-6-22')
	dict_aa = dict_append_proc (dict_aa,'t2975','橿原',438652,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2976','桜井',615879,'1951-10-12')
	dict_aa = dict_append_proc (dict_aa,'t2977','五條',372981,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t2978','御所',529416,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t2979','生駒',741823,'1951-11-8')

	return	dict_aa
}

// ----------------------------------------------------------------
