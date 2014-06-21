// -----------------------------------------------------------------
//	create/mysql_create.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mysql_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:mysql://host_mysql/city"

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
	sql_manipulate.insert_record_proc (sss,"t3321","岡山",41357,"1998-7-11")
	sql_manipulate.insert_record_proc (sss,"t3322","倉敷",34891,"1998-6-24")
	sql_manipulate.insert_record_proc (sss,"t3323","津山",56592,"1998-5-9")
	sql_manipulate.insert_record_proc (sss,"t3324","玉野",52481,"1998-9-29")
	sql_manipulate.insert_record_proc (sss,"t3325","笠岡",19237,"1998-10-16")
	sql_manipulate.insert_record_proc (sss,"t3326","井原",49784,"1998-11-24")
	sql_manipulate.insert_record_proc (sss,"t3327","総社",58296,"1998-12-30")
	sql_manipulate.insert_record_proc (sss,"t3328","高梁",41284,"1998-11-18")
	sql_manipulate.insert_record_proc (sss,"t3329","新見",58347,"1998-7-21")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
