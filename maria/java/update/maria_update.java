// ----------------------------------------------------------------------
/*
	java/update/maria_update.java

				Sep/05/2016


*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class maria_update
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.err.println ("*** 開始 ***");

	String	key_in = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	String url="jdbc:mysql://localhost/city";
	Connection conn=DriverManager.getConnection (url,"scott","tiger");

	rdb_common.update_proc	(conn,key_in,population);

	conn.close ();

	System.err.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
