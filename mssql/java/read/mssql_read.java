// --------------------------------------------------------------------
/*
	mssql/java/read/mssql_read.java

					Jan/11/2013

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
		String url = "jdbc:sqlserver://host_mssql;";
		url += "databaseName=city;";

		String user="sa";
		String passwd="scott_tiger";

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
