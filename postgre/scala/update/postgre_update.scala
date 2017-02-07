// -----------------------------------------------------------------
//	update/postgre_update.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object postgre_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	postgre_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def postgre_update_proc (id_in:String,population_in:Int)
{
	val str_connect= "jdbc:postgresql://localhost/city"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
