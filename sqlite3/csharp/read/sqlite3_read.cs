// -------------------------------------------------------------------
/*
	sqlite3_read.cs


					Apr/07/2015
*/
// -------------------------------------------------------------------
using	System;
using	Mono.Data.Sqlite;

// -------------------------------------------------------------------
class sqlite3_read
{
/* ------------------------------------------------------------------- */
static int Main (string[] args)
{
	string out_str;

	Console.Error.WriteLine ("*** 開始 ***");

	if (args.Length < 1)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string file_sqlite3 = args[0];

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";
 
	SqliteConnection conn = new SqliteConnection (str_connect);

	string str_query =
		"select ID,Name,Population,date_mod from cities";

	SqliteCommand cmd = new SqliteCommand (str_query,conn);

	conn.Open();
  
	SqliteDataReader dr = cmd.ExecuteReader();

	while	(dr.Read())
		{
		out_str = dr["ID"].ToString ()
			+ "\t" + dr["NAME"].ToString()
			 + "\t" +  dr["POPULATION"].ToString()
			 + "\t" +  dr["DATE_MOD"].ToString();

		Console.WriteLine (out_str);
		}
  
	dr.Close();
	dr.Dispose();
	cmd.Dispose();
	conn.Close();
	conn.Dispose();

	Console.Error.WriteLine ("*** 終了 ***");

	return	0;
}
// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
