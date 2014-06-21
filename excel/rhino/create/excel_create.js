#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	excel_create.js
					Aug/08/2013

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/excel_manipulate.js");

// ----------------------------------------------------------------
print ("*** 開始 ***");

var excel_file = arguments[0];

var dict_aa = data_prepare_proc ();

excel_write_proc (excel_file,dict_aa);

dict_display_proc (dict_aa);

print ("*** 終了 ***");  
  
// ----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t2971','奈良',57398,'1951-2-3');
	dict_aa = dict_append_proc (dict_aa,'t2972','大和高田',46258,'1951-4-25');
	dict_aa = dict_append_proc (dict_aa,'t2973','大和郡山',52643,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t2974','天理',38726,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t2975','橿原',43852,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t2976','桜井',61579,'1951-10-12');
	dict_aa = dict_append_proc (dict_aa,'t2977','五條',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t2978','御所',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t2979','生駒',74857,'1951-11-8');

	return	dict_aa;
}

// ----------------------------------------------------------------
