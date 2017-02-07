// ------------------------------------------------------------------
/*
	maria_read.java

					Sep/05/2016

*/
// ------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
// ------------------------------------------------------------------
public class maria_read
{
public static void main(String[] args)
{
	System.err.println ("*** 開始 ***");

	try
	{
	String url="jdbc:mysql://localhost/city";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	rdb_common.display_proc (conn);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	System.err.println ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
