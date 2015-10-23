// -----------------------------------------------------------------
//	update/derby_update.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object derby_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in + "\t" + population_in)

	update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def update_proc (id_in:String,population_in:Int)
{
	val str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true"
	val conn = DriverManager.getConnection (str_connect)

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)
	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
