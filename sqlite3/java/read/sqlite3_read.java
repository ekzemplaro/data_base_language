// ----------------------------------------------------------------------
/*
	sqlite3_read.java

				Nov/28/2014


*/
// ----------------------------------------------------------------------
import	java.util.List;
import	java.util.ArrayList;

public class sqlite3_read
{

// ----------------------------------------------------------------------
public static void main(String args[])
{
	String sqlite3_file = args[0];

	System.out.println ("*** 開始 ***");

	System.out.println("LIB version: " + SQLite.Database.version());
	SQLite.Database db = new SQLite.Database();

	try
	{
	db.open(sqlite3_file, 0666);
	System.out.println("DB version: " + db.dbversion());

	String sql = "select * from cities";

	SQLite.Stmt stmt = db.prepare(sql);

	while (stmt.step())
		{
	int i, ncol = stmt.column_count();
//	System.out.println (ncol);
	String out_str = "";

	List<String> list_str = new ArrayList<String>();

	for (int it = 0; it < ncol; it++)
		{
		Object obj = stmt.column(it);
		out_str += obj.toString();

		if (it != (ncol - 1))
			{
			out_str +=  "\t";
			}
		list_str.add (obj.toString());
		}

	System.out.println (out_str);
	System.out.println (list_str.toString ());

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
