// -----------------------------------------------------------------
//	oracle_create.scala
//
//						May/23/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_create
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:oracl:thin:@spn109:1521/xe"

	Class.forName ("oracle.jdbc.driver.OracleDriver")

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	val sss = conn.createStatement ()

	rdb_common.drop_table_proc (sss)
	rdb_common.create_table_proc (sss)

	insert_data_proc (sss)

	rdb_common.display_proc (conn)

	sss.close
	conn.close

	println	("*** 終了 ***")
}


// -----------------------------------------------------------------
def insert_data_proc (sss:Statement)
{
	rdb_common.insert_record_proc (sss,"t0131","函館",79517,"1998-5-11")
	rdb_common.insert_record_proc (sss,"t0132","札幌",13421,"1998-9-24")
	rdb_common.insert_record_proc (sss,"t0133","帯広",27592,"1998-8-9")
	rdb_common.insert_record_proc (sss,"t0134","釧路",43291,"1998-9-12")
	rdb_common.insert_record_proc (sss,"t0135","旭川",66298,"1998-8-19")
	rdb_common.insert_record_proc (sss,"t0136","北見",25294,"1998-1-21")
	rdb_common.insert_record_proc (sss,"t0137","室蘭",98252,"1998-2-24")
	rdb_common.insert_record_proc (sss,"t0138","根室",14275,"1998-5-22")
	rdb_common.insert_record_proc (sss,"t0139","稚内",61537,"1998-7-17")

}

// -----------------------------------------------------------------
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
