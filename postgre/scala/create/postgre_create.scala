// -----------------------------------------------------------------
//	create/postgre_create.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object postgre_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:postgresql://localhost/city"

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
	sql_manipulate.insert_record_proc (sss,"t3461","広島",41563,"1998-7-11")
	sql_manipulate.insert_record_proc (sss,"t3462","福山",34287,"1998-6-24")
	sql_manipulate.insert_record_proc (sss,"t3463","東広島", 53697,"1998-5-9")
	sql_manipulate.insert_record_proc (sss,"t3464","呉",72681,"1998-9-29")
	sql_manipulate.insert_record_proc (sss,"t3465","尾道",18934,"1998-10-16")
	sql_manipulate.insert_record_proc (sss,"t3466","竹原",19782,"1998-11-24")
	sql_manipulate.insert_record_proc (sss,"t3467","三次",21756,"1998-12-30")
	sql_manipulate.insert_record_proc (sss,"t3468","大竹",48962,"1998-11-18")
	sql_manipulate.insert_record_proc (sss,"t3469","府中",71564,"1998-9-24")
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
