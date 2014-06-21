// ----------------------------------------------------------------------
/*
	update/db2_update.groovy

				May/30/2011

*/
// ----------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ----------------------------------------------------------------------
public class db2_update
{

// ----------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def	id = args[0]
	def	population = args[1]
	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	String driver = "COM.ibm.db2.jdbc.app.DB2Driver"

	String user = "scott"
	String pass = "tiger"

	def protocol = "jdbc:db2:cities"

	def sql = Sql.newInstance (protocol,user,pass,driver)

	println ("connected.")

	sql_manipulate.update_proc	(sql,id,population)

	sql.close ()

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
