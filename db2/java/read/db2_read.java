// ---------------------------------------------------------------------
/*
	java/read/db2_read.java

					May/30/2011
*/
// ---------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;


// ---------------------------------------------------------------------
class db2_read
{
// ---------------------------------------------------------------------
public static void main (String argv[])
	throws SQLException, ClassNotFoundException
{
	System.out.println ("*** 開始 ***");

	try
		{
		Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
//		Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
		}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	String url = "jdbc:db2:cities";
//	String url = "jdbc:db2://cpt003:48800/cities";

	String user = "scott";
	String pass = "tiger";

	Connection conn = DriverManager.getConnection (url,user,pass);

	System.out.println ("*** db2_read *** eeee ***");

	rdb_common.display_proc (conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
