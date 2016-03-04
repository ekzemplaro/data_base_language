// ----------------------------------------------------------------------
/*
	oracle_delete.java

				Aug/05/2015


*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class oracle_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	String host = "host_oracle";
	String user = "scott";
	String password = "tiger";

	String str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe";

	Connection conn =
		DriverManager.getConnection (str_connect,user,password);

	rdb_common.delete_proc	(conn,id);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
