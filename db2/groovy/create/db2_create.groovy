// ---------------------------------------------------------------------
/*
	create/db2_create.groovy

					May/30/2011

*/
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class db2_create
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "COM.ibm.db2.jdbc.app.DB2Driver"

	String user = "scott"
	String pass = "tiger"


	println ("*** db2_read *** eeee ***")

	def protocol = "jdbc:db2:cities"

	def sql = Sql.newInstance (protocol, user,pass,driver )

	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	insert_data_proc (sql)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
{
	sql_manipulate.insert_record_proc (sql,"t2871","神戸",57246,"1999-3-15")
	sql_manipulate.insert_record_proc (sql,"t2872","姫路",42415,"1999-4-24")
	sql_manipulate.insert_record_proc (sql,"t2873","尼崎", 56592,"1999-5-27")
	sql_manipulate.insert_record_proc (sql,"t2874","西宮",22386,"1999-9-29")
	sql_manipulate.insert_record_proc (sql,"t2875","洲本",10037,"1999-10-16")
	sql_manipulate.insert_record_proc (sql,"t2876","明石",49764,"1999-11-24")
	sql_manipulate.insert_record_proc (sql,"t2877","芦屋",58298,"1999-12-30")
	sql_manipulate.insert_record_proc (sql,"t2878","伊丹",46854,"1999-11-18")
	sql_manipulate.insert_record_proc (sql,"t2879","豊岡",51947,"1999-7-21")
	sql_manipulate.insert_record_proc (sql,"t2880","宝塚",47286,"1999-9-12")
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
