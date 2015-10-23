// ---------------------------------------------------------------------
/*
	java/create/db2_create.java

					May/30/2011

*/
// ---------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class db2_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	try
	{
	Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
	String url="jdbc:db2:cities";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);
	insert_data_proc (ss);

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}


	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss) throws SQLException
{
	rdb_common.insert_record_proc (ss,"t2871","神戸",41357,"2008-7-21");
	rdb_common.insert_record_proc (ss,"t2872","姫路",34241,"2008-6-14");
	rdb_common.insert_record_proc (ss,"t2873","尼崎", 56592,"2008-5-27");
	rdb_common.insert_record_proc (ss,"t2874","西宮",22386,"2008-9-29");
	rdb_common.insert_record_proc (ss,"t2875","洲本",10037,"2008-10-16");
	rdb_common.insert_record_proc (ss,"t2876","明石",49764,"2008-11-24");
	rdb_common.insert_record_proc (ss,"t2877","芦屋",58298,"2008-12-30");
	rdb_common.insert_record_proc (ss,"t2878","伊丹",46854,"2008-11-18");
	rdb_common.insert_record_proc (ss,"t2879","豊岡",51947,"2008-7-21");
	rdb_common.insert_record_proc (ss,"t2880","宝塚",47286,"2008-9-12");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
