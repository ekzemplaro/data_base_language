// ----------------------------------------------------------------------
/*
	db2/java/update/db2_update.java

				May/30/2011

*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

// ----------------------------------------------------------------------
public class db2_update
{

// ----------------------------------------------------------------------
public static void main (String[] args)
	throws SQLException, ClassNotFoundException
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);
	try
		{
		Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
		}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}

	System.out.println ("*** db2_read *** aaa ***");

	Connection conn = null;

	String url = "jdbc:db2:cities";

	String user = "scott";
	String pass = "tiger";

	conn = DriverManager.getConnection (url,user,pass);

	System.out.println ("connected.");

	rdb_common.update_proc	(conn,id,population);

//	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
