// -------------------------------------------------------------------
/*
	csharp_common/oracle_manipulate.cs

					May/23/2011


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.OracleClient;
using	System.Text;

// -------------------------------------------------------------------
public static class oracle_manipulate
{
// -------------------------------------------------------------------
/* [4]: */
public static DataTable oracle_data_fetch_proc (OracleConnection connection)
{
	DataTable dtable = table_manipulate.table_prepare_proc ();

	string	command = "SELECT * from cities order by ID";


	OracleDataAdapter da_adapter
		= new OracleDataAdapter (command,connection);

//	connection.Open ();
	da_adapter.Fill (dtable);
//	connection.Close ();

	return	dtable;
}

// -------------------------------------------------------------------
/* [6]: */
public static void oracle_table_modify_proc
	(OracleConnection connection,
	ref DataTable dtable,string id_a,int population_a)
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
		oracle_submit_proc (connection,id_a,population_a,str_date);
		}
}

/* ------------------------------------------------------------------- */
/* [6-4]: */
public static void oracle_submit_proc
	(OracleConnection connection,
	string id_a,int population_a,string str_date)
{
	string str_oracle_date = @"to_date ('" + str_date
		 + @"','YYYY/MM/DD HH24:MI:SS')";

	StringBuilder sb_sql = new StringBuilder
		("UPDATE cities SET POPULATION = "
		+ population_a + @" , DATE_MOD = " + str_oracle_date +
			@" WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	OracleCommand command = new OracleCommand (str_sql,connection);
//	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

//	connection.Close ();
}

// -------------------------------------------------------------------
public static DataTable row_delete_proc
	(OracleConnection connection,
	DataTable dtable,string id_a)
{
	StringBuilder st_filter
		= new StringBuilder (@"ID <> '" + id_a + @"'");

	DataView dv_dtable = dtable.DefaultView;

	dv_dtable.RowFilter = st_filter.ToString ();

	if (0 < dv_dtable.Count)
		{
		submit_delete_proc (connection,id_a);
		}

	return	dv_dtable.ToTable ();
}

/* ------------------------------------------------------------------- */
static void submit_delete_proc
	(OracleConnection connection,string id_a)
{
	StringBuilder sb_sql = new StringBuilder
			("DELETE from cities WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	OracleCommand command = new OracleCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

}

// -------------------------------------------------------------------
public static void table_drop_proc (OracleConnection connection)
{
	string sql_str_drop = "drop table cities";

	OracleCommand command = new OracleCommand (sql_str_drop,connection);
	command.ExecuteNonQuery ();

}

/* ------------------------------------------------------------------- */
public static void table_create_proc (OracleConnection connection)
{
	string sql_str_create = "create TABLE cities ("
			+ "id varchar(10) NOT NULL PRIMARY KEY,"
			+ "name varchar(20),"
			+ "population int,"
			+ "date_mod date)";


	OracleCommand command = new OracleCommand (sql_str_create,connection);
	command.ExecuteNonQuery ();
}


// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
