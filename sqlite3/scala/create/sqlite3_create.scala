// -----------------------------------------------------------------
//	create/sqlite3_create.scala
//
//						Dec/15/2014
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object sqlite3_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val file_db = args(0)

	val str_connect= "jdbc:sqlite:" + file_db

	Class.forName ("org.sqlite.JDBC")

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
	sql_manipulate.insert_record_proc (sss,"t0711","郡山",51342,"1998-7-21")
	sql_manipulate.insert_record_proc (sss,"t0712","会津若松",64343,"1998-6-14")
	sql_manipulate.insert_record_proc (sss,"t0713","白河", 81259,"1998-5-27")
	sql_manipulate.insert_record_proc (sss,"t0714","福島",57286,"1998-9-29")
	sql_manipulate.insert_record_proc (sss,"t0715","喜多方",42937,"1998-2-16")
	sql_manipulate.insert_record_proc (sss,"t0716","二本松",39784,"1998-11-24")
	sql_manipulate.insert_record_proc (sss,"t0717","いわき",78219,"1998-12-30")
	sql_manipulate.insert_record_proc (sss,"t0718","相馬",45184,"1998-10-12")
	sql_manipulate.insert_record_proc (sss,"t0719","須賀川",51378,"1998-7-15")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
