/* -------------------------------------------------------------------- */
/*
	oracle_read.groovy

					Sep/28/2010

*/
/* -------------------------------------------------------------------- */
import groovy.sql.Sql
import sql_manipulate
/* -------------------------------------------------------------------- */
public class oracle_read
{

/* -------------------------------------------------------------------- */
public static void main(String[] args)
{
	println ("*** 開始 ***")

	String driver = "oracle.jdbc.driver.OracleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@spn109:1521/xe"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}
/* -------------------------------------------------------------------- */
}
/* -------------------------------------------------------------------- */
