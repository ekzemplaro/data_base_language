// --------------------------------------------------------------------
/*
	oracle_read.groovy

					Aug/05/2015

*/
// --------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// --------------------------------------------------------------------
public class oracle_read
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	String host = "host_oracle"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@" + host + ":1521/xe"

	def sql = Sql.newInstance (protocol,user,password)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
