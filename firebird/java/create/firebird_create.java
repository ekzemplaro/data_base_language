// ---------------------------------------------------------------------
/*
	java/create/firebird_create.java

					Jun/01/2011

*/
// ---------------------------------------------------------------------
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class firebird_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	try
	{
	DriverManager.registerDriver(new org.firebirdsql.jdbc.FBDriver());

	String user     = "sysdba";
	String password = "tiger";
	String database = "/var/tmp/firebird/cities.fdb";

	Connection conn =
	DriverManager.getConnection("jdbc:firebirdsql:localhost/3050:" +
	database, user, password);

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);
	insert_data_proc (ss);

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();
	}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}


	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss) throws SQLException
{
	rdb_common.insert_record_proc (ss,"t3821","松山",36587,"2008-4-21");
	rdb_common.insert_record_proc (ss,"t3822","今治",26491,"2008-5-14");
	rdb_common.insert_record_proc (ss,"t3823","宇和島", 45278,"2008-5-27");
	rdb_common.insert_record_proc (ss,"t3824","八幡浜",24264,"2008-9-29");
	rdb_common.insert_record_proc (ss,"t3825","新居浜",19375,"2008-10-16");
	rdb_common.insert_record_proc (ss,"t3826","西条",19846,"2008-11-24");
	rdb_common.insert_record_proc (ss,"t3827","大洲",18197,"2008-12-30");
	rdb_common.insert_record_proc (ss,"t3828","伊予",47184,"2008-11-18");
	rdb_common.insert_record_proc (ss,"t3829","西予",52472,"2008-6-12");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

