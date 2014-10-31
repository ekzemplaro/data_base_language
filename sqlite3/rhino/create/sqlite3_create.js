#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	sqlite3_create.js
//
//						Oct/22/2014
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var database = arguments[0];

Class.forName ("org.sqlite.JDBC");

var user = "";
var passwd = "";

var url = "jdbc:sqlite:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);

var dict_aa = data_prepare_proc ();

insert_data_proc (conn,dict_aa);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn,dict_aa)
{
	for (var key in dict_aa)
		{
		var name = dict_aa[key]["name"];
		var population = dict_aa[key]["population"];
		var date_mod = dict_aa[key]["date_mod"];

		insert_record_proc (conn,key,name,population,date_mod);
		}
}

// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t0711','郡山',27163,'1951-3-25');
	dict_aa = dict_append_proc (dict_aa,'t0712','会津若松',35927,'1951-2-8');
	dict_aa = dict_append_proc (dict_aa,'t0713','白河',64371,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t0714','福島',78624,'1951-6-12');
	dict_aa = dict_append_proc (dict_aa,'t0715','喜多方',47952,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t0716','二本松',61579,'1951-10-19');
	dict_aa = dict_append_proc (dict_aa,'t0717','いわき',37481,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t0718','相馬',52816,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t0719','須賀川',74152,'1951-11-8');

	return	dict_aa;
}

// ------------------------------------------------------------------
