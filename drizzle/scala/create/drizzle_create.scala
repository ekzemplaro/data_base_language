// -----------------------------------------------------------------
//	create/drizzle_create.scala
//
//						Jul/15/2014
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object drizzle_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:drizzle://localhost:4427/city"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	val sss = conn.createStatement ()

	sql_manipulate.drop_table_proc (sss)
	sql_manipulate.create_table_proc (sss)

	insert_data_proc (sss)

	sql_manipulate.display_proc (conn)

	sss.close
	conn.close

	println	("*** 終了 ***")
}


// -----------------------------------------------------------------
def insert_data_proc (sss:Statement)
{
	sql_manipulate.insert_record_proc (sss,"t2651","京都",49357,"1998-2-21")
	sql_manipulate.insert_record_proc (sss,"t2652","福知山",31891,"1998-8-14")
	sql_manipulate.insert_record_proc (sss,"t2653","舞鶴",56892,"1998-3-7")
	sql_manipulate.insert_record_proc (sss,"t2654","綾部",72481,"1998-6-19")
	sql_manipulate.insert_record_proc (sss,"t2655","宇治",19237,"1998-10-26")
	sql_manipulate.insert_record_proc (sss,"t2656","宮津",39784,"1998-10-14")
	sql_manipulate.insert_record_proc (sss,"t2657","亀岡",51296,"1998-9-30")
	sql_manipulate.insert_record_proc (sss,"t2658","城陽",41284,"1998-11-18")
	sql_manipulate.insert_record_proc (sss,"t2659","向日",58347,"1998-5-21")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
