/* --------------------------------------------------------------- */
/*
	reader/mssql_reader.cs

			Apr/21/2010
*/
/* --------------------------------------------------------------- */
using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace db_apr22
/* --------------------------------------------------------------- */
{
class program_aa
{
/* --------------------------------------------------------------- */
static void Main (string [] args)
{
	SqlConnection cnn;
	SqlCommand cmd;

	Console.WriteLine ("*** start ***");


	string str_connect = @"server=cdbd025\SQLEXPRESS;"
			+ "uid=sa;"
			+ "pwd=hello9;"
			+ "database=city";

	cnn = new SqlConnection (str_connect);
	cnn.Open ();

	string str_sql = "Select id,name,population,date_mod From cities";

	cmd = new SqlCommand (str_sql, cnn);

	command_exec (ref cmd);
	cnn.Close ();

	Console.WriteLine ("*** end ***");
}

/* --------------------------------------------------------------- */
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


/* --------------------------------------------------------------- */
}
/* --------------------------------------------------------------- */
}


/* --------------------------------------------------------------- */
