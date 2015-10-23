// ----------------------------------------------------------------------
/*
	sqlite3_update.java

					Nov/28/2014


*/
// ----------------------------------------------------------------------
public class sqlite3_update
{

// ----------------------------------------------------------------------
public static void main(String args[])
{
	System.out.println ("*** 開始 ***");

	String sqlite3_file = args[0];
	String	key_in = args[1];
	int	population_in = Integer.parseInt (args[2]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation_in = " + population_in);

	System.out.println("LIB version: " + SQLite.Database.version());
	SQLite.Database db = new SQLite.Database();

	try
	{
	db.open(sqlite3_file, 0666);
	System.out.println("DB version: " + db.dbversion());

	String sql = rdb_common.update_sql_gen_proc (key_in,population_in);

	SQLite.Stmt stmt = db.prepare(sql);

	while (stmt.step())
		{
		int i, ncol = stmt.column_count();
		System.out.println (ncol);
		}

	stmt.close();

	db.close();
	}
	catch (SQLite.Exception ee)
		{
		ee.printStackTrace();
		}

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
