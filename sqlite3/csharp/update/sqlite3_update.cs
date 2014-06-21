// -------------------------------------------------------------------
/*
	sqlite3_update.cs

					Jun/13/2014


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

	String id_in = args[1];
	int	population_in = int.Parse (args[2]);
	Console.WriteLine (id_in + "\t" + population_in);

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	DataTable dtable = table_manipulate.table_prepare_proc ();

	data_fetch_proc (str_connect,dtable);

	table_modify_proc (str_connect,ref dtable,id_in,population_in);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// -------------------------------------------------------------------
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

// -------------------------------------------------------------------
/* [6]: */
static void table_modify_proc
	 (string str_connect,ref DataTable dtable,string id_a,int population_a)
{
	DateTime dateNow = DateTime.Now;
	string str_date = dateNow.ToString ();

	StringBuilder st_filter
		= new StringBuilder (@"ID = '" + id_a + @"'");

	DataView dv_dtable = dtable.DefaultView;

	dv_dtable.RowFilter = st_filter.ToString ();

	if (0 < dv_dtable.Count)
		{
		dv_dtable[0]["POPULATION"] = population_a;
		dv_dtable[0]["DATE_MOD"] = str_date;
		submit_proc (str_connect,id_a,population_a,str_date);
		}
}

/* ------------------------------------------------------------------- */
/* [6-4]: */
static void submit_proc
	(string str_connect,string id_a,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET POPULATION = "
			+ population_a + @" , DATE_MOD = '" + str_date +
			@"' WHERE ID = '" + id_a + "'");

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

