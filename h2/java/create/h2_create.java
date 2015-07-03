// ---------------------------------------------------------------------
/*
	create/h2_create.java

					Jun/12/2015

*/
// ---------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// ---------------------------------------------------------------------
public class h2_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String db_file = args[0];
	System.out.println (db_file);

	String database = "file:" + db_file;

	Connection conn =
	DriverManager.getConnection("jdbc:h2:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);
	insert_data_proc (ss);

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss)
	throws SQLException
{
	rdb_common.insert_record_proc (ss,"t4561","宮崎",71378,"2008-8-24");
	rdb_common.insert_record_proc (ss,"t4562","日南",49261,"2008-1-15");
	rdb_common.insert_record_proc (ss,"t4563","延岡",62795,"2008-2-21");
	rdb_common.insert_record_proc (ss,"t4564","都城",71435,"2008-8-23");
	rdb_common.insert_record_proc (ss,"t4565","小林",14732,"2008-10-12");
	rdb_common.insert_record_proc (ss,"t4566","日向",49516,"2008-5-7");
	rdb_common.insert_record_proc (ss,"t4567","串間",17625,"2008-6-24");
	rdb_common.insert_record_proc (ss,"t4568","西都",68374,"2008-9-14");
	rdb_common.insert_record_proc (ss,"t4569","えびの",51492,"2008-4-19");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
