// --------------------------------------------------------------------
/*
	mssql/java/read/mssql_read.java

					Aug/30/2017

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
		String url = "jdbc:sqlserver://localhost;";
		url += "databaseName=city;";

		String user="sa";
		String passwd="Sql12345";

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
