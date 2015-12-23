// ---------------------------------------------------------------------
/*
	mssql/java/create/mssql_create.java

					Nov/18/2015

*/
// ---------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class mssql_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	try
		{
//		String url = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;";
		String url = "jdbc:sqlserver://host_mssql\\EG;";
		url += "databaseName=city;";

		String user="sa";
		String passwd="Tiger123";

		Connection conn = DriverManager.getConnection (url,user,passwd);

		Statement ss = conn.createStatement ();

		try
			{
			rdb_common.drop_table_proc (ss);
			}
		catch (Exception ee)
			{
			ee.printStackTrace();
			}

		mssql_create_table_proc (ss);
		insert_data_proc (ss);

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
static void mssql_create_table_proc (Statement ss) throws SQLException
{
ss.execute ("create table cities (id nvarchar(10), name nvarchar(20), population int, date_mod datetime)");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss) throws SQLException
{
	rdb_common.insert_record_proc (ss,"t1071","前橋",62375,"2008-4-23");
	rdb_common.insert_record_proc (ss,"t1072","高崎",81463,"2008-8-16");
	rdb_common.insert_record_proc (ss,"t1073","桐生",58172,"2008-5-21");
	rdb_common.insert_record_proc (ss,"t1074","沼田",27953,"2008-9-16");
	rdb_common.insert_record_proc (ss,"t1075","伊勢崎",14259,"2008-10-14");
	rdb_common.insert_record_proc (ss,"t1076","水上",24978,"2008-11-21");
	rdb_common.insert_record_proc (ss,"t1077","太田",89163,"2008-12-16");
	rdb_common.insert_record_proc (ss,"t1078","安中",42357,"2008-5-8");
	rdb_common.insert_record_proc (ss,"t1079","みどり",51783,"2008-7-21");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
