// ------------------------------------------------------------------
/*
	drizzle_read.java

					Sep/01/2015

*/
// ------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
// ------------------------------------------------------------------
public class drizzle_read
{
// ------------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String url="jdbc:drizzle://cddn007-ee:4427/city";
//	String url="jdbc:drizzle://172.20.208.103:4427/city";
//	String url="jdbc:drizzle://localhost:4427/city";
//	String url="jdbc:drizzle://host_ubuntu1:4427/city";
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	rdb_common.display_proc (conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
