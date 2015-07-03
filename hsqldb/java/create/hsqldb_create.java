// ---------------------------------------------------------------------
/*
	hsqldb/java/create/hsqldb_create.java

					Jun/12/2015

*/
// ---------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ---------------------------------------------------------------------
public class hsqldb_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String driver = "org.hsqldb.jdbcDriver";

	Class.forName (driver).newInstance ();

	String db_file = args[0];
	System.out.println (db_file);
	String database = "file:" + db_file + ";shutdown=true";

	Connection conn =
	DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	System.out.println ("*** connected. ***");

	Statement ss = conn.createStatement ();

	rdb_common.drop_table_proc (ss);
	rdb_common.create_table_proc (ss);
	insert_data_proc (ss);

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss)
	throws SQLException
{
	rdb_common.insert_record_proc (ss,"t4671","鹿児島",52716,"2008-6-27");
	rdb_common.insert_record_proc (ss,"t4672","指宿",74839,"2008-5-16");
	rdb_common.insert_record_proc (ss,"t4673","志布志",64935,"2008-5-21");
	rdb_common.insert_record_proc (ss,"t4674","川内",27864,"2008-9-28");
	rdb_common.insert_record_proc (ss,"t4675","鹿屋",62517,"2008-10-6");
	rdb_common.insert_record_proc (ss,"t4676","枕崎",34928,"2008-11-21");
	rdb_common.insert_record_proc (ss,"t4677","出水",79831,"2008-4-16");
	rdb_common.insert_record_proc (ss,"t4678","阿久根",48237,"2008-5-21");
	rdb_common.insert_record_proc (ss,"t4679","霧島",59172,"2008-12-22");

}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
