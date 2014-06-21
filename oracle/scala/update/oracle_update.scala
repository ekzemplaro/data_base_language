// -----------------------------------------------------------------
//	oracle_update.scala
//
//						May/23/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	oracle_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def oracle_update_proc (id_in:String,population_in:Int)
{
	val str_connect= "jdbc:oracl:thin:@spn109:1521/xe"

	Class.forName ("oracle.jdbc.driver.OracleDriver")

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.update_proc (conn,id_in,population_in)
	rdb_common.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
