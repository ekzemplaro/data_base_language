// -----------------------------------------------------------------
//	create/maria_create.scala
//
//						May/21/2014
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object maria_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:mysql://localhost/city"

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
	sql_manipulate.insert_record_proc (sss,"t3321","岡山",421357,"1998-9-11")
	sql_manipulate.insert_record_proc (sss,"t3322","倉敷",347891,"1998-2-24")
	sql_manipulate.insert_record_proc (sss,"t3323","津山",561392,"1998-8-9")
	sql_manipulate.insert_record_proc (sss,"t3324","玉野",524981,"1998-1-29")
	sql_manipulate.insert_record_proc (sss,"t3325","笠岡",192537,"1998-4-16")
	sql_manipulate.insert_record_proc (sss,"t3326","井原",692784,"1998-10-24")
	sql_manipulate.insert_record_proc (sss,"t3327","総社",582936,"1998-11-30")
	sql_manipulate.insert_record_proc (sss,"t3328","高梁",415289,"1998-12-18")
	sql_manipulate.insert_record_proc (sss,"t3329","新見",581347,"1998-7-21")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
