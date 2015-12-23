// ----------------------------------------------------------------------
/*
	java/delete/mssql_delete.java

				Nov/18/2015


*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class mssql_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

//	String url = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;";
	String url = "jdbc:sqlserver://host_mssql\\EG;";
	url += "databaseName=city;";
	url += "user=sa;password=Tiger123;";

	Connection conn = DriverManager.getConnection (url);

	rdb_common.delete_proc	(conn,id);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
