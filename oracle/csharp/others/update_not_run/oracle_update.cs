/* ------------------------------------------------------------------- */
/*
	update/oracle_update.cs

					Mar/01/2010

	csc oracle_update.cs -r:System.Data -r:System.Data.OracleClient

	Not Run on Windows

	Not run on Linux

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.Data.OracleClient;
using	System.Text;

/* ------------------------------------------------------------------- */
class oracle_update
{
/* ------------------------------------------------------------------- */
static void Main (string[] args)
{
	Console.WriteLine ("*** start *** Mar/01/2010 ***");

	string str_connect =
		"User Id=system;Password=hello9;Data Source=cpt003:1521/xe";
//		"User Id=system;Password=hello9;Data Source=spn109:1521/orcl";

	DataTable dtable = new DataTable ();

	dtable.Columns.Add (new DataColumn ("ID",typeof (int)));
	dtable.Columns.Add (new DataColumn ("NAME",typeof (string)));
	dtable.Columns.Add (new DataColumn ("POPULATION",typeof (int)));
	dtable.Columns.Add (new DataColumn ("DATE_MOD",typeof (DateTime)));
	dtable.PrimaryKey = new DataColumn [] {dtable.Columns["ID"]};
 
	data_fetch_proc (str_connect,dtable);

	Console.WriteLine ("*** data fetched ***");


	table_modify_proc (ref dtable,34,4567000);
	table_modify_proc (ref dtable,35,1237000);

	data_update_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** end ***");
}

/* ------------------------------------------------------------------- */
/* [4]: */
static void data_fetch_proc (string str_connect,DataTable dtable)
{
	OracleConnection connection = new OracleConnection (str_connect);

	OracleDataAdapter da_adapter = CreateCustomerAdapter (connection);

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
	Console.WriteLine ("*** data_update_proc *** aaa ***");

	OracleConnection connection = new OracleConnection (str_connect);

	OracleDataAdapter da_adapter = CreateCustomerAdapter (connection);

	Console.WriteLine ("*** data_update_proc *** ccc ***");

	connection.Open ();

	Console.WriteLine ("*** data_update_proc *** fff ***");
    // add handlers
	da_adapter.RowUpdating += 
		new OracleRowUpdatingEventHandler (OnRowUpdating);
	da_adapter.RowUpdated += 
		new OracleRowUpdatedEventHandler (OnRowUpdated);

	Console.WriteLine ("*** data_update_proc *** hhh ***");
	try
		{
	Console.WriteLine ("*** data_update_proc *** iii ***");
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
public static OracleDataAdapter CreateCustomerAdapter (OracleConnection conn)
{
	OracleDataAdapter da = new OracleDataAdapter ();
	OracleCommand cmd;

	string sql_str = "SELECT * from cities";

	cmd = new OracleCommand (sql_str,conn);

	da.SelectCommand = cmd;

// Create the UpdateCommand.

	string str_up = "UPDATE cities SET ID = pID, NAME = pName, "
		+ "POPULATION = pPopulation, DATE_MOD = pDate_mod "
		+ "WHERE ID = poldID";

	cmd = new OracleCommand  (str_up,conn);

	OracleParameter parm1 = new OracleParameter ("pID", OracleType.Number);
	OracleParameter parm2 = 
		new OracleParameter ("pName", OracleType.VarChar);
	OracleParameter parm3 = 
		new OracleParameter ("pPopulation", OracleType.Number);
	OracleParameter parm4 = 
		new OracleParameter ("pDate_mod", OracleType.DateTime);
	OracleParameter parm5 = 
		new OracleParameter ("poldID", OracleType.Number);

	parm1.Direction = ParameterDirection.Input;
	parm2.Direction = ParameterDirection.Input;
	parm3.Direction = ParameterDirection.Input;
	parm4.Direction = ParameterDirection.Input;
	parm5.Direction = ParameterDirection.Input;

	cmd.Parameters.Add (parm1);
	cmd.Parameters.Add (parm2);
	cmd.Parameters.Add (parm3);
	cmd.Parameters.Add (parm4);
	cmd.Parameters.Add (parm5);
/*
	parm = cmd.Parameters.Add ("poldID", OracleType.Number);
	parm.SourceVersion = DataRowVersion.Original;
*/
	da.UpdateCommand = cmd;

	return da;
}

/* ------------------------------------------------------------------- */
static void OnRowUpdating (object sender, OracleRowUpdatingEventArgs e) 
{
    PrintEventArgs(e);
}

// handler for RowUpdated event
/* ------------------------------------------------------------------- */
static void OnRowUpdated (object sender, OracleRowUpdatedEventArgs e) 
{
    PrintEventArgs(e);
}


/* ------------------------------------------------------------------- */
static void PrintEventArgs (OracleRowUpdatingEventArgs args) 
{
	Console.WriteLine("OnRowUpdating");
	Console.WriteLine("  event args: ("+ " command=" + args.Command);
	Console.WriteLine("CommandText =" + args.Command.CommandText);
	Console.WriteLine (" commandType=" + args.StatementType + 
        " status=" + args.Status + ")");
}

/* ------------------------------------------------------------------- */
static void PrintEventArgs (OracleRowUpdatedEventArgs args) 
{
    Console.WriteLine("OnRowUpdated");
    Console.WriteLine( "  event args: ("+
        " command=" + args.Command +
        " commandType=" + args.StatementType + 
        " recordsAffected=" + args.RecordsAffected + 
        " status=" + args.Status + ")");
}

/* ------------------------------------------------------------------- */
}
/* ------------------------------------------------------------------- */

