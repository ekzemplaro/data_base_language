#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	maria_read.js
//
//						Jan/06/2017
//
// ------------------------------------------------------------------
importPackage(java.sql)
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js")

print ("*** 開始 ***")

var url = "jdbc:mysql://localhost/city"
var user = "scott"
var passwd = "tiger"

var conn = DriverManager.getConnection (url,user,passwd)

disp_proc (conn)

conn.close ()

print ("*** 終了 ***")
// ------------------------------------------------------------------
