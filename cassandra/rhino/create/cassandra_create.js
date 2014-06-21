#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	cassandra_create.js
//
//						Sep/05/2013
//
// ------------------------------------------------------------------
importPackage (java.lang);

importPackage (java.sql);

load ("/var/www/data_base/common/rhino_common/cassandra_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ---------------------------------------------------------------------- 
print ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var str_connect = "jdbc:cassandra://localhost:9160/city";
var conn = DriverManager.getConnection (str_connect);

dict_to_cassandra_proc (dict_aa,conn);

print ("*** 終了 ***");

// ---------------------------------------------------------------------- 
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t0531','秋田',26943,'1951-8-25');
	dict_aa = dict_append_proc (dict_aa,'t0532','男鹿',35872,'1951-1-8');
	dict_aa = dict_append_proc (dict_aa,'t0533','由利本荘',26491,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t0534','横手',72456,'1951-6-12');
	dict_aa = dict_append_proc (dict_aa,'t0535','鹿角',43952,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t0536','大館',61579,'1951-10-19');
	dict_aa = dict_append_proc (dict_aa,'t0537','能代',37481,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t0538','にかほ',52816,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t0539','湯沢',74152,'1951-11-8');

	return	dict_aa;
}

// ---------------------------------------------------------------------- 
