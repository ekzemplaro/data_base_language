// --------------------------------------------------------------------
/*
		oracle/java/read/oracle_read.java

					Aug/05/2015

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

	String host = "host_oracle";
	String user = "scott";
	String password = "tiger";

	String str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe";

	try {
		Connection conn =
		DriverManager.getConnection (str_connect,user,password);

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
