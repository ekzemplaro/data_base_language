#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	cassandra_read.js
//
//						Sep/05/2013
//
// ------------------------------------------------------------------
importPackage(java.lang);

importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/cassandra_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ---------------------------------------------------------------------- 
print ("*** 開始 ***");

var str_connect = "jdbc:cassandra://localhost:9160/city";
var conn = DriverManager.getConnection (str_connect)

var dict_aa = cassandra_to_dict_proc (conn)

dict_display_proc (dict_aa);

print ("*** 終了 ***");
// ---------------------------------------------------------------------- 
