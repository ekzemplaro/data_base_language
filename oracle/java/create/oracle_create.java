// --------------------------------------------------------------------
/*
	oracle_create.java

					May/23/2011

*/
// --------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

// --------------------------------------------------------------------
public class oracle_create
{

// --------------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");


		Connection conn =
		DriverManager.getConnection
			("jdbc:oracl:thin:@spn109:1521/xe","scott","tiger");


		Statement ss = conn.createStatement ();
		rdb_common.drop_table_proc (ss);
		rdb_common.create_table_proc (ss);

		insert_data_proc (ss);

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
static void insert_data_proc (Statement ss) throws SQLException
{
	rdb_common.insert_record_proc (ss,"t0131","函館",41537,"2008-9-21");
	rdb_common.insert_record_proc (ss,"t0132","札幌",37471,"2008-6-14");
	rdb_common.insert_record_proc (ss,"t0133","帯広",52592,"2008-5-7");
	rdb_common.insert_record_proc (ss,"t0134","釧路",81345,"2008-9-12");
	rdb_common.insert_record_proc (ss,"t0135","旭川",76238,"2008-8-19");
	rdb_common.insert_record_proc (ss,"t0136","北見",28295,"2008-1-21");
	rdb_common.insert_record_proc (ss,"t0137","室蘭",96254,"2008-2-24");
	rdb_common.insert_record_proc (ss,"t0138","根室",15276,"2008-5-22");
	rdb_common.insert_record_proc (ss,"t0139","稚内",67532,"2008-7-17");
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
