#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ---------------------------------------------------------------------
/*
	db2_create.js

					Jun/02/2011

*/
// ---------------------------------------------------------------------
importPackage (java.sql);
importPackage (java.lang);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ---------------------------------------------------------------------
print ("*** 開始 ***");

Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
var url="jdbc:db2:cities";
var conn = DriverManager.getConnection (url,"scott","tiger");

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);

disp_proc (conn);

conn.close();

print ("*** 終了 ***");

// ---------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t2871","神戸",71357,"1951-7-21");
	insert_record_proc (conn,"t2872","姫路",34241,"1951-6-14");
	insert_record_proc (conn,"t2873","尼崎",56592,"1951-5-27");
	insert_record_proc (conn,"t2874","西宮",27386,"1951-9-29");
	insert_record_proc (conn,"t2875","洲本",16437,"1951-10-16");
	insert_record_proc (conn,"t2876","明石",49764,"1951-11-24");
	insert_record_proc (conn,"t2877","芦屋",58298,"1951-12-30");
	insert_record_proc (conn,"t2878","伊丹",46854,"1951-11-18");
	insert_record_proc (conn,"t2879","豊岡",51947,"1951-7-21");
	insert_record_proc (conn,"t2880","宝塚",47286,"1951-9-12");
}

// ---------------------------------------------------------------------
