// --------------------------------------------------------------------
/*
		postgre/java/read/postgre_read.java

					Jan/24/2011

	java -cp postgresql-8.3-604.jdbc4.jar:. postgre_read
*/
// --------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// --------------------------------------------------------------------
public class postgre_read
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	try {

	Connection conn = DriverManager.getConnection
		("jdbc:postgresql://localhost/city","scott","tiger");

	rdb_common.display_proc (conn);

	conn.close ();
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
