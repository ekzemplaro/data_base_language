#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	maria_update.js
//
//						Jan/06/2017
//
// ------------------------------------------------------------------
importPackage(java.sql)
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js")
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")

print	("*** 開始 ***")

var id_in=arguments[0]
var population_in=arguments[1]

var url = "jdbc:mysql://localhost/city"
var user = "scott"
var passwd = "tiger"

var conn = DriverManager.getConnection( url, user, passwd )

update_proc (conn,id_in,population_in)

conn.close()

print	("*** 終了 ***")
// ------------------------------------------------------------------
