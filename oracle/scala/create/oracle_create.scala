// -----------------------------------------------------------------
//	oracle_create.scala
//
//						Aug/05/2015
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

	var host = "host_oracle"
	var user = "scott"
	var password = "tiger"

	val str_connect= "jdbc:oracl:thin:@" + host + ":1521/xe"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	val stmt = conn.createStatement ()

	rdb_common.drop_table_proc (stmt)
	rdb_common.create_table_proc (stmt)

	insert_data_proc (stmt)

	stmt.close
	conn.close

	println	("*** 終了 ***")
}


// -----------------------------------------------------------------
def insert_data_proc (sss:Statement)
{
	rdb_common.insert_record_proc (sss,"t0131","函館",79512,"11-MAY-1998")
	rdb_common.insert_record_proc (sss,"t0132","札幌",13421,"24-SEP-1998")
	rdb_common.insert_record_proc (sss,"t0133","帯広",27598,"9-AUG-1998")
	rdb_common.insert_record_proc (sss,"t0134","釧路",43291,"12-SEP-1998")
	rdb_common.insert_record_proc (sss,"t0135","旭川",67218,"19-OCT-1998")
	rdb_common.insert_record_proc (sss,"t0136","北見",25894,"21-JAN-1998")
	rdb_common.insert_record_proc (sss,"t0137","室蘭",98351,"24-FEB-1998")
	rdb_common.insert_record_proc (sss,"t0138","根室",14275,"14-MAY-1998")
	rdb_common.insert_record_proc (sss,"t0139","稚内",61538,"17-JUL-1998")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
