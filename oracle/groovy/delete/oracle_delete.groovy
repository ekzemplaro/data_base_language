// ----------------------------------------------------------------------
/*
	oracle_delete.groovy

				May/23/2011


*/
// ----------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ----------------------------------------------------------------------
public class oracle_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	println ("*** 開始 ***")

	String	id = args[0]
	println ("\tid = " + id)

	String driver = "oracle.jdbc.driver.OracleDriver"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@spn109:1521/xe"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc	(sql,id)

	sql_manipulate.display_proc	(sql)

	sql.close ()

	System.out.println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
