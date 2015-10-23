// -----------------------------------------------------------------
//	update/sqlite3_update.scala
//
//						Jul/27/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object sqlite3_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val file_db = args(0)
	val id_in = args(1)
	val population_in = Integer.parseInt (args(2))

	println (id_in)
	println (population_in)

	sqlite3_update_proc (file_db,id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def sqlite3_update_proc (file_db:String,id_in:String,population_in:Int)
{
	val str_connect= "jdbc:sqlite:" + file_db


	Class.forName ("org.sqlite.JDBC")


	val conn = DriverManager.getConnection (str_connect)

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
