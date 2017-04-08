// ------------------------------------------------------------------
/*
	maria_read.java

					Apr/08/2017

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
	String user = "scott";
	String password = "tiger123";

	Connection conn = DriverManager.getConnection (url,user,password);

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
