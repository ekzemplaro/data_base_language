#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	oracle_update.js
//
//						Aug/05/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
importPackage(java.text);
importPackage(java.util);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

var host = "host_oracle";

var url = "jdbc:oracl:thin:@" + host + ":1521/xe";
var user = "scott";
var passwd = "tiger";


sql_str = str_gen_oracle_update_proc (id_in,population_in);

var conn = DriverManager.getConnection (url,user,passwd);
var stmt = conn.createStatement();
var rs   = stmt.executeUpdate(sql_str);

stmt.close ();
conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function str_gen_oracle_update_proc (id_in,population_in)
{
	var today = new Date ();

	var dfm = new SimpleDateFormat ("dd-MMM-yyyy",Locale.ENGLISH);
	var str_ddx = dfm.format (today);

	var sql  = "update cities set population=" + population_in
		+ ",DATE_MOD='" + str_ddx +  "'  where ID= '" + id_in + "'";

	print (sql);

	return (sql);
}

// ------------------------------------------------------------------
