// -------------------------------------------------------------------
/*
	sqlite3_delete.cs

					Jun/13/2014


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

	string	id_in = args[1];
	Console.WriteLine (id_in);

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	DataTable dtable = table_manipulate.table_prepare_proc ();

	data_fetch_proc (str_connect,dtable);

	dtable = row_delete_proc (str_connect,dtable,id_in);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

/* ------------------------------------------------------------------- */
/* [4]: */
static void data_fetch_proc (string str_connect,DataTable dtable)
{
	string command = "SELECT * FROM cities order by ID";

	SqliteConnection connection = new SqliteConnection (str_connect);

	SqliteDataAdapter da_adapter
		= new SqliteDataAdapter (command,str_connect);

	connection.Open ();
	da_adapter.Fill (dtable);
	connection.Close ();
}

/* ------------------------------------------------------------------- */
/* [6]: */
static DataTable row_delete_proc
	 (string str_connect,DataTable dtable,string id_a)
{
	StringBuilder st_filter
		= new StringBuilder (@"ID <> '" + id_a + @"'");

	DataView dv_dtable = dtable.DefaultView;

	dv_dtable.RowFilter = st_filter.ToString ();

	if (0 < dv_dtable.Count)
		{
		submit_delete_proc (str_connect,id_a);
		}

	return	dv_dtable.ToTable ();
}

/* ------------------------------------------------------------------- */
/* [6-4]: */
static void submit_delete_proc (string str_connect,string id_a)
{
	StringBuilder sb_sql = new StringBuilder
			("DELETE from cities WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	SqliteConnection connection = new SqliteConnection (str_connect);
	SqliteCommand command = new SqliteCommand (str_sql,connection);
	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

	connection.Close ();
}

/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

