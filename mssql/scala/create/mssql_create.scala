// -----------------------------------------------------------------
//	create/mssql_create.scala
//
//						Jan/11/2013
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mssql_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

//	val str_connect= "jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city;"
	val str_connect= "jdbc:sqlserver://host_mssql;databaseName=city;"
	val conn = DriverManager.getConnection (str_connect,"sa","scott_tiger")

	val sss = conn.createStatement ()

	sql_manipulate.drop_table_proc (sss)

	mssql_create_table_proc (sss)

	insert_data_proc (sss)

	sql_manipulate.display_proc (conn)

	sss.close
	conn.close

	println	("*** 終了 ***")
}


// -----------------------------------------------------------------
def mssql_create_table_proc (sss:Statement)
{
sss.execute ("create table cities (id varchar(10), name varchar(20), population int, date_mod datetime)")
}

// -----------------------------------------------------------------
def insert_data_proc (sss:Statement)
{
	sql_manipulate.insert_record_proc (sss,"t1071","前橋",31965,"1998-9-23")
	sql_manipulate.insert_record_proc (sss,"t1072","高崎",29784,"1998-7-16")
	sql_manipulate.insert_record_proc (sss,"t1073","桐生",24162,"1998-5-21")
	sql_manipulate.insert_record_proc (sss,"t1074","沼田",37879,"1998-2-16")
	sql_manipulate.insert_record_proc (sss,"t1075","伊勢崎",65819,"1998-10-14")
	sql_manipulate.insert_record_proc (sss,"t1076","水上",98274,"1998-11-21")
	sql_manipulate.insert_record_proc (sss,"t1077","太田",89563,"1998-12-16")
	sql_manipulate.insert_record_proc (sss,"t1078","安中",47832,"1998-5-8")
	sql_manipulate.insert_record_proc (sss,"t1079","みどり",57943,"1998-7-21")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
