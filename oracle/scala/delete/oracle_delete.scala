// -----------------------------------------------------------------
//	oracle_delete.scala
//
//						May/23/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	oracle_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def oracle_delete_proc (id_in:String)
{
	val str_connect= "jdbc:oracl:thin:@spn109:1521/xe"

	Class.forName ("oracle.jdbc.driver.OracleDriver")

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.delete_proc (conn,id_in)
	rdb_common.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
