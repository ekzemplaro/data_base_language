// -----------------------------------------------------------------
//	delete/sqlite3_delete.scala
//
//						Dec/15/2014
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object sqlite3_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val file_db = args(0)
	val key_in = args(1)

	println (key_in)

	sqlite3_delete_proc (file_db,key_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def sqlite3_delete_proc (file_db:String,key_in:String)
{
	val str_connect= "jdbc:sqlite:" + file_db

	Class.forName ("org.sqlite.JDBC")

	val conn = DriverManager.getConnection (str_connect)

	sql_manipulate.delete_proc (conn,key_in)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
