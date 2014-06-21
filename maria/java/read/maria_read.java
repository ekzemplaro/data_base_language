// ------------------------------------------------------------------
/*
	maria_read.java

					Sep/16/2013

*/
// ------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
// ------------------------------------------------------------------
public class maria_read
{
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

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

	System.out.println ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
