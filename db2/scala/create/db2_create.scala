// ---------------------------------------------------------------------
/*
	db2_create.scala

					May/30/2011

*/
// ---------------------------------------------------------------------
import scala.io.Source
import java.sql._

// ---------------------------------------------------------------------
object db2_create
{
// ---------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance()

	var conn: Connection = null

	val str_connect= "jdbc:db2:cities"

	conn = DriverManager.getConnection (str_connect,"scott","tiger")


	val sss = conn.createStatement ()

	rdb_common.drop_table_proc (sss)
	rdb_common.create_table_proc (sss)
	insert_data_proc (sss)

	rdb_common.display_proc (conn)

	sss.close

	conn.close

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
def insert_data_proc (sss:Statement)
{
	rdb_common.insert_record_proc (sss,"t2871","神戸",35781,"1998-7-21")
	rdb_common.insert_record_proc (sss,"t2872","姫路",24176,"1998-6-14")
	rdb_common.insert_record_proc (sss,"t2873","尼崎", 56592,"1998-5-27")
	rdb_common.insert_record_proc (sss,"t2874","西宮",22386,"1998-9-29")
	rdb_common.insert_record_proc (sss,"t2875","洲本",10037,"1998-10-16")
	rdb_common.insert_record_proc (sss,"t2876","明石",49764,"1998-11-24")
	rdb_common.insert_record_proc (sss,"t2877","芦屋",58298,"1998-12-30")
	rdb_common.insert_record_proc (sss,"t2878","伊丹",46854,"1998-11-18")
	rdb_common.insert_record_proc (sss,"t2879","豊岡",51947,"1998-7-21")
	rdb_common.insert_record_proc (sss,"t2880","宝塚",47286,"1998-9-12")
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
