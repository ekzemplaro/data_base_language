// -----------------------------------------------------------------
//	create/firebird_create.scala
//
//						Aug/03/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object firebird_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val database = "/var/tmp/firebird/cities.fdb"

	val str_connect= "jdbc:firebirdsql:localhost/3050:" + database

	Class.forName ("org.firebirdsql.jdbc.FBDriver")

	val conn = DriverManager.getConnection (str_connect,"sysdba","tiger")

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
	sql_manipulate.insert_record_proc (sss,"t3821","松山",32565,"1998-12-12")
	sql_manipulate.insert_record_proc (sss,"t3822","今治",27241,"1998-6-24")
	sql_manipulate.insert_record_proc (sss,"t3823","宇和島	", 51267,"1998-5-7")
	sql_manipulate.insert_record_proc (sss,"t3824","八幡浜",92328,"1998-9-29")
	sql_manipulate.insert_record_proc (sss,"t3825","新居浜",71537,"1998-10-16")
	sql_manipulate.insert_record_proc (sss,"t3826","西条",61984,"1998-11-24")
	sql_manipulate.insert_record_proc (sss,"t3827","大洲",18196,"1998-10-30")
	sql_manipulate.insert_record_proc (sss,"t3828","伊予",42384,"1998-9-18")
	sql_manipulate.insert_record_proc (sss,"t3829","西予",51479,"1998-7-21")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
