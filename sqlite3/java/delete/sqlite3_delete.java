// ----------------------------------------------------------------------
/*
	sqlite3_delete.java

					Nov/28/2014


*/
// ----------------------------------------------------------------------
public class sqlite3_delete
{

// ----------------------------------------------------------------------
public static void main(String args[])
{
	System.out.println ("*** 開始 ***");

	String sqlite3_file = args[0];
	String	key_in = args[1];
	System.out.println ("\tkey_in = " + key_in);

	System.out.println("LIB version: " + SQLite.Database.version());
	SQLite.Database db = new SQLite.Database();

	try
	{
	db.open(sqlite3_file, 0666);
	System.out.println("DB version: " + db.dbversion());

	String sql = "delete from  cities where ID= '" + key_in + "'";

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
