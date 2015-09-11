// ----------------------------------------------------------------------
/*
	oracle_delete.groovy

				Aug/05/2015


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

	String host = "host_oracle"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@" + host + ":1521/xe"

	def sql = Sql.newInstance (protocol,user,password)

	sql_manipulate.delete_proc	(sql,id)

	sql.close ()

	System.out.println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
