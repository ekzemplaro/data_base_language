// ---------------------------------------------------------------
/*
	read/mssql_read.cs

				Nov/18/2015
*/
// ---------------------------------------------------------------
using System;
using System.Text;
using System.Data.SqlClient;

// ---------------------------------------------------------------
class mssql_read
{
// ---------------------------------------------------------------
static void Main (string [] args)
{
	SqlConnection cnn;
	SqlCommand cmd;

	Console.WriteLine ("*** 開始 ***");

	string server_mssql = @"server=host_mssql\EG;";

	string str_connect = server_mssql
			+ "uid=sa;"
			+ "pwd=Tiger123;"
			+ "database=city";

	cnn = new SqlConnection (str_connect);
	cnn.Open ();

	string str_sql = "Select id,name,population,date_mod From cities";

	cmd = new SqlCommand (str_sql, cnn);

	command_exec (ref cmd);
	cnn.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// ---------------------------------------------------------------
static void command_exec (ref SqlCommand cmd)
{
	SqlDataReader dr_sql;
	dr_sql = cmd.ExecuteReader();

	while (dr_sql.Read ())
	{
	StringBuilder str_ss = new StringBuilder ();

	for (int it = 0; it < dr_sql.FieldCount; it++)
		{
		str_ss.Append (dr_sql.GetValue(it).ToString ());
		str_ss.Append ("\t");
		}

	Console.WriteLine (str_ss);
	}

	dr_sql.Close();
}

// ---------------------------------------------------------------
}

// ---------------------------------------------------------------
