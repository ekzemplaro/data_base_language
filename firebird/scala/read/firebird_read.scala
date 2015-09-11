// -----------------------------------------------------------------
//	read/firebird_read.scala
//
//						Aug/25/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object firebird_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	var conn: Connection = null

	val database = "/var/tmp/firebird/cities.fdb"
//	val str_connect= "jdbc:firebirdsql:localhost/3050:" + database
//	val str_connect= "jdbc:firebirdsql:host_dbase:" + database
	val str_connect= "jdbc:firebirdsql:cddn007-ee:" + database

	Class.forName ("org.firebirdsql.jdbc.FBDriver")

	conn = DriverManager.getConnection (str_connect,"sysdba","tiger")

	sql_manipulate.display_proc (conn)

	conn.close
	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
