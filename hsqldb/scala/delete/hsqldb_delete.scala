// -----------------------------------------------------------------
//	delete/hsqldb_delete.scala
//
//						Jul/27/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object hsqldb_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println	(id_in)

	hsqldb_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def hsqldb_delete_proc (id_in:String)
{
	val database = "file:/var/tmp/hsqldb/cities;shutdown=true"

	val str_connect= "jdbc:hsqldb:" + database

	Class.forName ("org.hsqldb.jdbcDriver")
	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.delete_proc (conn,id_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
