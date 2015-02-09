// ---------------------------------------------------------------------
/*
	hsqldb/java/create/hsqldb_create.java

					Jan/28/2015

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

	String database = "file:/var/tmp/hsqldb/cities;shutdown=true";


	Connection conn =
	DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	System.out.println ("*** connected. ***");

	Statement ss = conn.createStatement ();

rdb_common.drop_table_proc (ss);
rdb_common.create_table_proc (ss);
insert_data_proc (ss);

	rdb_common.display_proc (conn);
	System.out.println ("*** ffff ***");

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_data_proc (Statement ss)
	throws SQLException
{
	rdb_common.insert_record_proc (ss,"t4671","鹿児島",52716,"2008-6-27");
	rdb_common.insert_record_proc (ss,"t4672","指宿",71839,"2008-5-16");
	rdb_common.insert_record_proc (ss,"t4673","志布志",64935,"2008-5-21");
	rdb_common.insert_record_proc (ss,"t4674","川内",27264,"2008-9-28");
	rdb_common.insert_record_proc (ss,"t4675","鹿屋",62517,"2008-10-6");
	rdb_common.insert_record_proc (ss,"t4676","枕崎",34518,"2008-11-21");
	rdb_common.insert_record_proc (ss,"t4677","出水",79831,"2008-4-16");
	rdb_common.insert_record_proc (ss,"t4678","阿久根",49137,"2008-5-21");
	rdb_common.insert_record_proc (ss,"t4679","霧島",59872,"2008-12-22");

}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
