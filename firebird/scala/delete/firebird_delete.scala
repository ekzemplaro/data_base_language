// -----------------------------------------------------------------
//	delete/firebird_delete.scala
//
//						Aug/25/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object firebird_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	firebird_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def firebird_delete_proc (id_in:String)
{
	val database = "/var/tmp/firebird/cities.fdb"
//	val str_connect= "jdbc:firebirdsql:localhost/3050:" + database
	val str_connect= "jdbc:firebirdsql:cddn007-ee:" + database

	Class.forName ("org.firebirdsql.jdbc.FBDriver")

	val conn = DriverManager.getConnection (str_connect,"sysdba","tiger")

	sql_manipulate.delete_proc (conn,id_in)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
