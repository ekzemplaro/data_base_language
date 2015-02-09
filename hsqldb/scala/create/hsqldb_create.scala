// -----------------------------------------------------------------
//	create/hsqldb_create.scala
//
//						Jan/28/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object hsqldb_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val database = "file:/var/tmp/hsqldb/cities;shutdown=true"

	val str_connect= "jdbc:hsqldb:" + database

	Class.forName ("org.hsqldb.jdbcDriver")
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
	sql_manipulate.insert_record_proc (sss,"t4671","鹿児島",52716,"1998-6-12")
	sql_manipulate.insert_record_proc (sss,"t4672","指宿",41398,"1998-5-21")
	sql_manipulate.insert_record_proc (sss,"t4673","志布志",64259,"1998-5-21")
	sql_manipulate.insert_record_proc (sss,"t4674","川内",27134,"1998-9-28")
	sql_manipulate.insert_record_proc (sss,"t4675","鹿屋",12987,"1998-10-6")
	sql_manipulate.insert_record_proc (sss,"t4676","枕崎",34513,"1998-11-21")
	sql_manipulate.insert_record_proc (sss,"t4677","出水",19835,"1998-2-6")
	sql_manipulate.insert_record_proc (sss,"t4678","阿久根",49132,"1998-5-29")
	sql_manipulate.insert_record_proc (sss,"t4679","霧島",79815,"1998-10-12")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
