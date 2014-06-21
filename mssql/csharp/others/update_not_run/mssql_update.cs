/* ------------------------------------------------------------------- */
/*
	update/mssql_update.cs

					Apr/02/2010

	csc mssql_update.cs -r:System.Data

	Run on Windows

		But not run on Linux

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Data.SqlClient;
using	System.Text;

/* ------------------------------------------------------------------- */
class mssql_update
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	int	id_in = int.Parse (args[0]);
	int	population_in = int.Parse (args[1]);

	string str_connect =
		@"server=cdbd025\SQLEXPRESS;"
		+ "uid=sa;"
		+ "pwd=hello9;"
		+ "database=city;";

	DataTable dtable = table_manipulate.table_prepare_proc ();

/*
	dtable.Columns.Add (new DataColumn ("ID",typeof (int)));
	dtable.Columns.Add (new DataColumn ("NAME",typeof (string)));
	dtable.Columns.Add (new DataColumn ("POPULATION",typeof (int)));
	dtable.Columns.Add (new DataColumn ("DATE_MOD",typeof (DateTime)));
*/ 
	data_fetch_proc (str_connect,dtable);

	table_modify_proc (ref dtable,id_in,population_in);

	table_manipulate.display_proc (dtable);

	data_update_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

/* ------------------------------------------------------------------- */
/* [4]: */
static void data_fetch_proc (string str_connect,DataTable dtable)
{
//	string command = "select ID,Name,Population,date_mod from cities";

	string command = "SELECT * FROM cities";

	SqlConnection connection = new SqlConnection (str_connect);
	SqlCommand sqlCAT = connection.CreateCommand ();
	sqlCAT.CommandText = command;
/*
	SqlDataAdapter da_adapter
			= new SqlDataAdapter (command,str_connect);
*/ 
	SqlDataAdapter da_adapter = new SqlDataAdapter ();
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
	string command = "SELECT * FROM cities";

	SqlConnection connection = new SqlConnection (str_connect);
	SqlCommand sqlCAT = connection.CreateCommand ();
	sqlCAT.CommandText = command;
/*
	SqlDataAdapter da_adapter
			= new SqlDataAdapter (command,str_connect);
*/
	Console.WriteLine ("*** data_update bbb ***");
	SqlDataAdapter da_adapter = new SqlDataAdapter ();
	da_adapter.SelectCommand = sqlCAT;

	SqlCommandBuilder builder = new SqlCommandBuilder (da_adapter);
/*
bool flag_u = true;
	da_adapter.UpdateCommand = builder.GetUpdateCommand (flag_u);
Console.WriteLine ("*** data_update eee ***");
Console.WriteLine (da_adapter.UpdateCommand.ToString ());
*/

	da_adapter.UpdateCommand = new SqlCommand
		("Update cities SET NAME = @NAME,"
		+ "POPULATION = @POPULATION, DATE_MOD = @DATE_MOD "
		+ " where  ID = @ID", connection);

	da_adapter.UpdateCommand.Parameters.Add
			("@NAME", SqlDbType.VarChar, 10, "NAME");

	da_adapter.UpdateCommand.Parameters.Add
			("@POPULATION", SqlDbType.Int, 10, "POPULATION");

	da_adapter.UpdateCommand.Parameters.Add
			("@DATE_MOD", SqlDbType.DateTime, 20, "DATE_MOD");

	da_adapter.UpdateCommand.Parameters.Add
			("@ID", SqlDbType.Int, 10, "ID");

	connection.Open ();
Console.WriteLine ("*** data_update fff ***");

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


Console.WriteLine ("*** data_update ggg ***");
	connection.Close ();
Console.WriteLine ("*** data_update hhh ***");
}

/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

