// --------------------------------------------------------------------
/*
	java/update/oracle_update.java

				Aug/05/2015


*/
// --------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// --------------------------------------------------------------------
public class oracle_update
{

// --------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	String host = "host_oracle";
	String user = "scott";
	String password = "tiger";

	String str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe";

	Connection conn =
		DriverManager.getConnection (str_connect,user,password);

	oracle_manipulate.oracle_update_proc	(conn,id,population);

	conn.close ();

	System.out.println ("*** 終了 ***");
}


// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
