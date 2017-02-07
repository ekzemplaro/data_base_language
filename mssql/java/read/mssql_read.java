// --------------------------------------------------------------------
/*
	mssql/java/read/mssql_read.java

					Nov/18/2015

*/
// --------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// --------------------------------------------------------------------
public class mssql_read
{

// --------------------------------------------------------------------
public static void main(String[] args)
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

		rdb_common.display_proc (conn);
		}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	System.out.println ("*** 終了 ***");
}
// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
