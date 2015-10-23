/* ------------------------------------------------------------------- */
/*
	command/postgre_command.cs

					Jul/16/2010


	csc postgre_command.cs -r:System.Data -r:Npgsql

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Text;
using	Npgsql;

/* ------------------------------------------------------------------- */
class postgre_command
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

//	string server="cdbd026";
//	string server="cpt003";
	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=uchida;Password=hello9;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	DataTable dtable = table_manipulate.table_prepare_proc ();
 
	data_fetch_proc (str_connect,dtable);

	Console.WriteLine ();

	data_modify_proc (str_connect,ref dtable,3468,4000);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

/* ------------------------------------------------------------------- */
/* [4]: */
static void data_fetch_proc (string str_connect,DataTable dtable)
{
	string command = "SELECT * FROM cities order by ID";

	NpgsqlConnection connection = new NpgsqlConnection (str_connect);
	NpgsqlCommand sqlCAT = connection.CreateCommand ();
	sqlCAT.CommandText = command;

	NpgsqlDataAdapter da_adapter = new NpgsqlDataAdapter ();
	da_adapter.SelectCommand = sqlCAT;

	connection.Open ();
	da_adapter.Fill (dtable);
	connection.Close ();
}

/* ------------------------------------------------------------------- */
/* [6]: */
static void data_modify_proc
	(string str_connect,ref DataTable dtable,int id_a,int population_a)
{
	DateTime dateNow = DateTime.Now;
	string str_date = dateNow.ToString ();


	StringBuilder st_filter
		= new StringBuilder (@"ID = '" + id_a + @"'");

	DataView dv_dtable = new DataView (dtable);

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
	(string str_connect,int id_a,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET POPULATION = "
			+ population_a + @" , DATE_MOD = '" + str_date +
			@"' WHERE ID = " + id_a);

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	NpgsqlConnection connection = new NpgsqlConnection (str_connect);
	NpgsqlCommand command = new NpgsqlCommand (str_sql,connection);

	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

	connection.Close ();
}

/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

