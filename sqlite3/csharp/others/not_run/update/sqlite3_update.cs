/* ------------------------------------------------------------------- */
/*
	/sqlite3_update.cs

					Jul/15/2010

	csc sqlite3_update.cs -r:System.Data -r:Mono.Data.Sqlite

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Text;
using	Mono.Data.Sqlite;

/* ------------------------------------------------------------------- */
class sqlite_update
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string file_sqlite3 = "/var/tmp/sqlite3/cities.db";

	string str_connect =
		@"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	DataTable dtable = table_manipulate.table_prepare_proc ();
 
	data_fetch_proc (str_connect,dtable);

	table_manipulate.update_proc (ref dtable,718,7000789);

	data_update_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
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
/* [8]: */
static void data_update_proc (string str_connect,DataTable dtable)
{
	string command = "SELECT * FROM cities";

	SqliteConnection connection = new SqliteConnection (str_connect);

	SqliteDataAdapter da_adapter
		= new SqliteDataAdapter (command,connection);
	da_adapter.UpdateCommand = new SqliteCommand
		("Update cities SET NAME = @NAME,"
		+ "POPULATION = @POPULATION, DATE_MOD = @DATE_MOD "
		+ " where  ID = @ID", connection);

	da_adapter.UpdateCommand.Parameters.Add
			("@NAME", DbType.String, 10, "NAME");

	da_adapter.UpdateCommand.Parameters.Add
			("@POPULATION", DbType.Int32, 10, "POPULATION");

	da_adapter.UpdateCommand.Parameters.Add
			("@DATE_MOD", DbType.Date, 10, "DATE_MOD");

	da_adapter.UpdateCommand.Parameters.Add
			("@ID", DbType.Int32, 10, "ID");


	connection.Open ();

	try
		{
		da_adapter.Update (dtable);
		}
	catch	(Exception exp)
		{
		Console.Error.WriteLine ("*** error *** da_adapter.Update ***");
		Console.Error.WriteLine
		("*** error *** " + exp);
		Environment.Exit (1);
		}

	connection.Close ();
	Console.WriteLine ("*** update *** end ***");
}

/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

