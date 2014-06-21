#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	ftp_create.js
//
//					Jul/31/2011
//
//
// --------------------------------------------------------------
importPackage (java.util);
importPackage (java.io);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/file_io.js");
load ("/var/www/data_base/common/rhino_common/ftp_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var hostname = "host_dbase";
var user = "scott";
var passwd = "tiger";
var path_file = "city/iwate.json";


var dict_aa =  data_prepare_proc ();


dict_display_proc (dict_aa);

var json_new = JSON.stringify (dict_aa);

// print	(json_new);


ftp_put_proc (hostname,user,passwd,path_file,json_new);

print ("***** 終了 *****");
 
// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t0361','盛岡',86372,'1951-7-12');
	dict_aa = dict_append_proc (dict_aa,'t0362','久慈',57914,'1951-1-25');
	dict_aa = dict_append_proc (dict_aa,'t0363','二戸',26413,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t0364','宮古',38724,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t0365','遠野',43852,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t0366','八幡平',61579,'1951-10-12');
	dict_aa = dict_append_proc (dict_aa,'t0367','大船渡',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t0368','一関',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t0369','花巻',85791,'1951-11-8');

	return	dict_aa;
}
// --------------------------------------------------------------
