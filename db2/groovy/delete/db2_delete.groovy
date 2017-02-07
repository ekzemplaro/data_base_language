// ----------------------------------------------------------------------
/*
	db2_delete.groovy

				May/30/2011

*/
// ----------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate

// ----------------------------------------------------------------------
public class db2_delete
{

// ----------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def	id = args[0]
	println ("\tid = " + id)

	String driver = "COM.ibm.db2.jdbc.app.DB2Driver"

	String user = "scott"
	String pass = "tiger"

	def protocol = "jdbc:db2:cities"

	def sql = Sql.newInstance (protocol,user,pass,driver)

	sql_manipulate.delete_proc	(sql,id)

	sql.close ()

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
