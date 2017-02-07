// -------------------------------------------------------------------
/*
	sqlite3_delete.cs

					Aug/25/2015


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Mono.Data.Sqlite;

// -------------------------------------------------------------------
class sqlite3_delete
{
// -------------------------------------------------------------------
static int Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	if (args.Length < 2)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string file_sqlite3 = args[0];

	string	key_in = args[1];
	Console.WriteLine (key_in);

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	SqliteConnection conn = new SqliteConnection (str_connect);

	conn.Open ();
	sqlite3_delete_proc (conn,key_in);
	conn.Close ();

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// -------------------------------------------------------------------
/* [4]: */
static void sqlite3_delete_proc
	(SqliteConnection conn,string key_in)
{
	StringBuilder sb_sql = new StringBuilder
			("DELETE from cities WHERE ID = '" + key_in + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	SqliteCommand command = new SqliteCommand (str_sql,conn);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
