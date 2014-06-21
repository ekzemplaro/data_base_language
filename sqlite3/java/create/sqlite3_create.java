// ---------------------------------------------------------------------
/*
	java/create/sqlite3_create.java

					May/15/2013

*/
// ---------------------------------------------------------------------
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.DriverManager;


// ---------------------------------------------------------------------
public class sqlite3_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	try
	{
	Class.forName ("org.sqlite.JDBC");

	String sqlite3_file = args[0];

	String str_connect = "jdbc:sqlite:" + sqlite3_file;

	System.out.println ("\tstr_connect = " + str_connect);

	Connection conn = DriverManager.getConnection (str_connect);


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
	rdb_common.insert_record_proc (ss,"t0711","郡山",41256,"2008-7-21");
	rdb_common.insert_record_proc (ss,"t0712","会津若松",34817,"2008-6-14");
	rdb_common.insert_record_proc (ss,"t0713","白河", 58259,"2008-5-27");
	rdb_common.insert_record_proc (ss,"t0714","福島",27381,"2008-9-29");
	rdb_common.insert_record_proc (ss,"t0715","喜多方",14537,"2008-2-16");
	rdb_common.insert_record_proc (ss,"t0716","二本松",19764,"2008-11-24");
	rdb_common.insert_record_proc (ss,"t0717","いわき",82193,"2008-12-30");
	rdb_common.insert_record_proc (ss,"t0718","相馬",42789,"2008-10-12");
	rdb_common.insert_record_proc (ss,"t0719","須賀川",54973,"2008-7-15");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

