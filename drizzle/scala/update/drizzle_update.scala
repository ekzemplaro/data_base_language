// -----------------------------------------------------------------
//	update/drizzle_update.scala
//
//						Jul/15/2014
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object drizzle_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	drizzle_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def drizzle_update_proc (id_in:String,population_in:Int)
{

	val str_connect= "jdbc:drizzle://localhost:4427/city"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
