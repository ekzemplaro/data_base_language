// -----------------------------------------------------------------
//	create/derby_create.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object derby_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true"

	val conn = DriverManager.getConnection (str_connect)

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
	sql_manipulate.insert_record_proc (sss,"t3551","山口",41375,"1998-6-21")
	sql_manipulate.insert_record_proc (sss,"t3552","下関",34298,"1998-10-14")
	sql_manipulate.insert_record_proc (sss,"t3553","萩", 64281,"1998-5-27")
	sql_manipulate.insert_record_proc (sss,"t3554","徳山",27258,"1998-9-29")
	sql_manipulate.insert_record_proc (sss,"t3555","岩国",13782,"1998-10-16")
	sql_manipulate.insert_record_proc (sss,"t3556","光",19783,"1998-5-24")
	sql_manipulate.insert_record_proc (sss,"t3557","長門",38216,"1998-12-3")
	sql_manipulate.insert_record_proc (sss,"t3558","防府",45682,"1998-6-8")
	sql_manipulate.insert_record_proc (sss,"t3559","宇部",72541,"1998-5-12")
}
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
