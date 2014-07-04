/* ------------------------------------------------------------------- */
/*
	read/mssql_read.cs

					Jul/19/2010

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Data.SqlClient;

class mssql_read
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string str_connect =
		@"server=host_mssql;"
		+ "uid=sa;" + "pwd=scott_tiger;" + "database=city;";
 
	string command = "select ID,Name,Population,date_mod from cities";

	SqlDataAdapter da_adapter
			= new SqlDataAdapter (command,str_connect);

	DataTable dtable = new DataTable ();

	try
	{

	da_adapter.Fill (dtable);

//	table_manipulate.display_proc (dtable);
	}
	catch (NotSupportedException ex)
		{
		Console.WriteLine ("*** NotSupportedException ***");
		Console.WriteLine ("*** message ***");
		Console.WriteLine (ex);
		Console.WriteLine ("*** message ***");
		}

	Console.WriteLine ("*** 終了 ***");
}
 
/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

