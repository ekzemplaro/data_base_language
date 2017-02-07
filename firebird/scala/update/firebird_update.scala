// -----------------------------------------------------------------
//	update/firebird_update.scala
//
//						Aug/25/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object firebird_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	firebird_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def firebird_update_proc (id_in:String,population_in:Int)
{
	val database = "/var/tmp/firebird/cities.fdb"
//	val str_connect= "jdbc:firebirdsql:localhost/3050:" + database
	val str_connect= "jdbc:firebirdsql:cddn007-ee:" + database

	Class.forName ("org.firebirdsql.jdbc.FBDriver")

	val conn = DriverManager.getConnection (str_connect,"sysdba","tiger")

	sql_manipulate.update_proc (conn,id_in,population_in)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
