// -----------------------------------------------------------------
//	create/h2_create.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object h2_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val database = "file:/var/tmp/h2/cities"

	val str_connect= "jdbc:h2:" + database

	val conn = DriverManager.getConnection (str_connect,"SA","")

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
	sql_manipulate.insert_record_proc (sss,"t4561","宮崎",51236,"1998-9-14")
	sql_manipulate.insert_record_proc (sss,"t4562","日南",98247,"1998-3-25")
	sql_manipulate.insert_record_proc (sss,"t4563","延岡",19748,"1998-1-21")
	sql_manipulate.insert_record_proc (sss,"t4564","都城",76439,"1998-8-23")
	sql_manipulate.insert_record_proc (sss,"t4565","小林",89532,"1998-10-12")
	sql_manipulate.insert_record_proc (sss,"t4566","日向",49715,"1998-5-7")
	sql_manipulate.insert_record_proc (sss,"t4567","串間",57324,"1998-6-24")
	sql_manipulate.insert_record_proc (sss,"t4568","西都",82476,"1998-9-14")
	sql_manipulate.insert_record_proc (sss,"t4569","えびの",51437,"1998-4-19")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
