// -------------------------------------------------------------------
/*
	sqlite3_update.cs

					Aug/25/2015


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Mono.Data.Sqlite;

// -------------------------------------------------------------------
class sqlite3_update
{
// -------------------------------------------------------------------
static int Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	if (args.Length < 3)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string file_sqlite3 = args[0];

	String key_in = args[1];
	int	population_in = int.Parse (args[2]);
	Console.WriteLine (key_in + "\t" + population_in);

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	SqliteConnection conn = new SqliteConnection (str_connect);

	conn.Open ();
	sqlite3_update_proc (conn,key_in,population_in);
	conn.Close ();


	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// -------------------------------------------------------------------
/* [4]: */
public static void sqlite3_update_proc
	(SqliteConnection conn,string id_a,int population_a)
{
	DateTime dateNow = DateTime.Now;

	string str_date = dateNow.ToString("yyyy-MM-dd HH:mm:ss");
	Console.WriteLine (str_date);

	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET population = "
			+ population_a + @" , date_mod = '" + str_date +
			@"' WHERE id = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	SqliteCommand command = new SqliteCommand (str_sql,conn);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

