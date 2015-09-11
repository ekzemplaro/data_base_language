#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	firebird_create.js
//
//						Aug/25/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var dict_aa = data_prepare_proc ()

Class.forName ("org.firebirdsql.jdbc.FBDriver");

var user = "sysdba";
var passwd = "tiger";
var database = "/var/tmp/firebird/cities.fdb";

var url = "jdbc:firebirdsql:host_firebird:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
dict_to_db_proc (conn,dict_aa);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t3821','松山',57163,'1951-7-25')
	dict_aa = dict_append_proc (dict_aa,'t3822','今治',29357,'1951-2-8')
	dict_aa = dict_append_proc (dict_aa,'t3823','宇和島',52641,'1951-5-2')
	dict_aa = dict_append_proc (dict_aa,'t3824','八幡浜',31724,'1951-6-12')
	dict_aa = dict_append_proc (dict_aa,'t3825','新居浜',43952,'1951-8-14')
	dict_aa = dict_append_proc (dict_aa,'t3826','西条',61579,'1951-10-19')
	dict_aa = dict_append_proc (dict_aa,'t3827','大洲',37481,'1951-3-21')
	dict_aa = dict_append_proc (dict_aa,'t3828','伊予',52816,'1951-7-26')
	dict_aa = dict_append_proc (dict_aa,'t3829','西予',74152,'1951-11-8')

	return	dict_aa
}
// ------------------------------------------------------------------
