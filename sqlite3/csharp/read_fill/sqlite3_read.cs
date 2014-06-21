/* ------------------------------------------------------------------- */
/*
	/sqlite3_read.cs


					Jul/15/2010

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	Mono.Data.Sqlite;

/* ------------------------------------------------------------------- */
class sqlite3_read
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string file_sqlite3 = args[0];

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";
 
	string command = "select ID,Name,Population,date_mod from cities";

	SqliteDataAdapter da_adapter
			= new SqliteDataAdapter (command,str_connect);

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}
 
/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

