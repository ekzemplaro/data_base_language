// -----------------------------------------------------------------
//	update/hsqldb_update.scala
//
//						Jul/27/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object hsqldb_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in + "\t" + population_in)

	hsqldb_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def hsqldb_update_proc (id_in:String,population_in:Int)
{
	val database = "file:/var/tmp/hsqldb/cities;shutdown=true"

	val str_connect= "jdbc:hsqldb:" + database

	Class.forName ("org.hsqldb.jdbcDriver")
	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
