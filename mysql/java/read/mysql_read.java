// ------------------------------------------------------------------
/*
	mysql_read.java

					Sep/26/2012

*/
// ------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
// ------------------------------------------------------------------
public class mysql_read
{
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	try
	{
	String url="jdbc:mysql://host_mysql/city";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");


	rdb_common.display_proc (conn);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	System.out.println ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
