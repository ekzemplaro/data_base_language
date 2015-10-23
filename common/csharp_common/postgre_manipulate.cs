// -------------------------------------------------------------------
/*
	csharp_common/postgre_manipulate.cs

					Sep/28/2011


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Npgsql;

// -------------------------------------------------------------------
public class postgre_manipulate
{
// -------------------------------------------------------------------
/* [4]: */
public static void data_fetch_proc (string str_connect,DataTable dtable)
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
/* [8]: */
public static void data_update_proc (string str_connect,DataTable dtable)
{
	string command = "SELECT * FROM cities";

Console.WriteLine ("*** data_update_proc ***");

	NpgsqlConnection connection = new NpgsqlConnection (str_connect);
	NpgsqlCommand sqlCAT = connection.CreateCommand ();
	sqlCAT.CommandText = command;

	NpgsqlDataAdapter da_adapter = new NpgsqlDataAdapter ();
	da_adapter.SelectCommand = sqlCAT;

	DataRow row = dtable.Rows[0];

	NpgsqlCommandBuilder builder = new NpgsqlCommandBuilder (da_adapter);

	da_adapter.UpdateCommand = builder.GetUpdateCommand (row);

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
}

// -------------------------------------------------------------------
/* [10]: */
public static void data_delete_proc (string str_connect,string id_in)
{
	StringBuilder sb_sql = new StringBuilder
		("DELETE from cities  WHERE ID = '" + id_in + "'");

Console.WriteLine ("*** data_delete_proc ***");

	string str_sql = sb_sql.ToString ();
	Console.WriteLine (str_sql);

	NpgsqlConnection connection = new NpgsqlConnection (str_connect);

	NpgsqlCommand command = new NpgsqlCommand (str_sql,connection);

	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

	connection.Close ();
}

// -------------------------------------------------------------------
public static void table_drop_proc (string str_connect)
{
	string sql_str_drop = "drop table cities";

	NpgsqlConnection connection = new NpgsqlConnection (str_connect);

	NpgsqlCommand command = new NpgsqlCommand (sql_str_drop,connection);
	connection.Open ();
	command.ExecuteNonQuery ();
	connection.Close ();

}

// -------------------------------------------------------------------
public static void table_create_proc (string str_connect)
{

	string sql_str_create = "create TABLE cities ("
			+ "ID varchar(10) NOT NULL PRIMARY KEY,"
			+ "NAME text,"
			+ "POPULATION int,"
			+ "DATE_MOD text)";


	NpgsqlConnection connection = new NpgsqlConnection (str_connect);

	NpgsqlCommand command = new NpgsqlCommand (sql_str_create,connection);
	connection.Open ();
	command.ExecuteNonQuery ();

	connection.Close ();
}
// -------------------------------------------------------------------
public static void insert_proc
	(string str_connect,string id_a,string name,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, Name, Population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();


	NpgsqlConnection connection = new NpgsqlConnection (str_connect);
	NpgsqlCommand command = new NpgsqlCommand (str_sql,connection);
	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}

	connection.Close ();
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
