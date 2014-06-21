// --------------------------------------------------------------------
/*
		oracle/java/read/oracle_read.java

					Jan/25/2011

*/
// --------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// --------------------------------------------------------------------
public class oracle_read
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection conn =
		DriverManager.getConnection
			("jdbc:oracl:thin:@spn109:1521/xe","scott","tiger");

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
