// ----------------------------------------------------------------
//	sqlite3_csharp_read.aspx.cs
//
//
//					Sep/18/2011
//
// ----------------------------------------------------------------
using System;
using System.Data;
using Mono.Data.Sqlite;

// ----------------------------------------------------------------
public class sqlite3_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string file_sqlite3 = "/var/tmp/sqlite3/cities.db";

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	string command = "select ID,Name,Population,date_mod from cities";

	SqliteDataAdapter da_adapter
		= new SqliteDataAdapter (command,str_connect);

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);

	string json_str = table_manipulate.table_json_str_proc (dtable);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
