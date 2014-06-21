// ---------------------------------------------------------------------
/*
	create/derby_create.groovy

					Jul/03/2011

*/
// ---------------------------------------------------------------------
import java.sql.*;

import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
public class derby_create
{
// ---------------------------------------------------------------------
public static void main (args)
{
	println ("*** 開始 ***")

	def driver = "org.apache.derby.jdbc.ClientDriver"

	def protocol = "jdbc:derby://localhost:1527/city_aaa;create=true"

	def sql = Sql.newInstance (protocol, driver)


	sql_manipulate.drop_table_proc (sql)
	sql_manipulate.create_table_proc (sql)

	println ("*** bbbbb ***")

	insert_data_proc (sql)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void insert_data_proc (sql)
	throws SQLException
{
	sql_manipulate.insert_record_proc (sql,"t3551","山口",78932,"1999-7-15");
	sql_manipulate.insert_record_proc (sql,"t3552","下関",24571,"1999-8-17");
	sql_manipulate.insert_record_proc (sql,"t3553","萩", 56312,"1999-5-27");
	sql_manipulate.insert_record_proc (sql,"t3554","徳山",47835,"1999-9-21");
	sql_manipulate.insert_record_proc (sql,"t3555","岩国",19635,"1999-10-16");
	sql_manipulate.insert_record_proc (sql,"t3556","光",39726,"1999-8-24");
	sql_manipulate.insert_record_proc (sql,"t3557","長門",87219,"1999-12-3");
	sql_manipulate.insert_record_proc (sql,"t3558","防府",41583,"1999-11-18");
	sql_manipulate.insert_record_proc (sql,"t3559","宇部",29547,"1999-7-19");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
