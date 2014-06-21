/* ------------------------------------------------------------------- */
/*
	/mysql_update.cs

					Mar/26/2010

	csc mysql_update.cs -r:System.Data -r:MySql.Data.dll

	Run on Windows

	But not run on Linux

		System.InvalidOperationException:
	 		Auto SQL generation during Update requires
			a valid SelectCommand.
*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Text;
using	MySql.Data.MySqlClient;

/* ------------------------------------------------------------------- */
class mysql_update
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** start *** Mar/26/2010 ***");

//	string server="cdbd026";
	string server="localhost";
	string str_db="city";

	string str_connect = "Server=" + server +
	";User Id=uchida;Password=hello9;" +
		"Database=" + str_db + ";";

	DataTable dtable = new DataTable ();

	dtable.Columns.Add (new DataColumn ("ID",typeof (int)));
	dtable.Columns.Add (new DataColumn ("NAME",typeof (string)));
	dtable.Columns.Add (new DataColumn ("POPULATION",typeof (int)));
	dtable.Columns.Add (new DataColumn ("DATE_MOD",typeof (DateTime)));
 
	data_fetch_proc (str_connect,dtable);

	table_modify_proc (ref dtable,3327,40056789);

	data_update_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** end ***");
}

/* ------------------------------------------------------------------- */
/* [4]: */
static void data_fetch_proc (string str_connect,DataTable dtable)
{
	string command = "SELECT * FROM cities order by ID";

	MySqlConnection connection = new MySqlConnection (str_connect);
	MySqlCommand sqlCAT = connection.CreateCommand ();
	sqlCAT.CommandText = command;

	MySqlDataAdapter da_adapter = new MySqlDataAdapter ();
	da_adapter.SelectCommand = sqlCAT;

	connection.Open ();
	da_adapter.Fill (dtable);
	connection.Close ();
}

/* ------------------------------------------------------------------- */
/* [6]: */
static void table_modify_proc (ref DataTable dtable,int id_a,int population_a)
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
		}
}

/* ------------------------------------------------------------------- */
/* [8]: */
static void data_update_proc (string str_connect,DataTable dtable)
{
	Console.WriteLine ("*** update *** aaa ***");
	string command = "SELECT * FROM cities";

	MySqlConnection connection = new MySqlConnection (str_connect);

	MySqlDataAdapter da_adapter = new MySqlDataAdapter (command,connection);
/*
	da_adapter.UpdateCommand = new MySqlCommand
		("Update cities SET NAME = @NAME,"
		+ "POPULATION = @POPULATION, DATE_MOD = @DATE_MOD "
		+ " where  ID = @ID", connection);

	da_adapter.UpdateCommand.Parameters.Add
			("@NAME", MySqlDbType.String, 10, "NAME");

	da_adapter.UpdateCommand.Parameters.Add
			("@POPULATION", MySqlDbType.Int32, 10, "POPULATION");

	da_adapter.UpdateCommand.Parameters.Add
			("@DATE_MOD", MySqlDbType.Date, 10, "DATE_MOD");

	da_adapter.UpdateCommand.Parameters.Add
			("@ID", MySqlDbType.Int32, 10, "ID");
*/

	MySqlCommandBuilder builder = new MySqlCommandBuilder (da_adapter);

	Console.WriteLine ("*** update *** ccc ***");

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

