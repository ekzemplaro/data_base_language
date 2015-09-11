// -------------------------------------------------------------------
/*
	mssql_manipulate.cs

					Aug/24/2015

*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.SqlClient;
using	System.Text;

// -------------------------------------------------------------------
public class mssql_manipulate
{
// -------------------------------------------------------------------
/* [4]: */
public static void mssql_data_fetch_proc
	(SqlConnection connection,DataTable dtable)
{
	string command = "SELECT * FROM cities";

	SqlDataAdapter da_adapter
			= new SqlDataAdapter (command,connection);

	da_adapter.Fill (dtable);
}

// -------------------------------------------------------------------
/* [6]: */
public static void mssql_table_update_proc
	(SqlConnection connection,
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

		mssql_update_proc (connection,id_a,population_a,str_date);
		}
}

// -------------------------------------------------------------------
/* [6-4]: */
public static void mssql_update_proc
	(SqlConnection connection,string id_a,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET POPULATION = "
			+ population_a + @" , DATE_MOD = '" + str_date +
			@"' WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	SqlCommand command = new SqlCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);
}

/* ------------------------------------------------------------------- */
public static DataTable row_delete_proc
	(SqlConnection connection,DataTable dtable,string id_a)
{
	StringBuilder st_filter
		= new StringBuilder (@"ID <> '" + id_a + @"'");

	DataView dv_dtable = dtable.DefaultView;

	dv_dtable.RowFilter = st_filter.ToString ();

	if (0 < dv_dtable.Count)
		{
		mssql_delete_proc (connection,id_a);
		}

	return	dv_dtable.ToTable ();
}

// -------------------------------------------------------------------
public static void mssql_delete_proc
	(SqlConnection connection,string id_a)
{
	StringBuilder sb_sql = new StringBuilder
			("DELETE from cities WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	SqlCommand command = new SqlCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

}

// -------------------------------------------------------------------
public static void table_drop_proc (SqlConnection conn)
{
	string sql_str_drop = "drop table cities";

	SqlCommand command = new SqlCommand (sql_str_drop,conn);

	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
public static void table_create_proc (SqlConnection conn)
{

	string sql_str_create = "create TABLE cities ("
			+ "ID nvarchar(10) NOT NULL PRIMARY KEY,"
			+ "NAME nvarchar(20),"
			+ "POPULATION int,"
			+ "DATE_MOD datetime)";


	SqlCommand command = new SqlCommand (sql_str_create,conn);
	command.ExecuteNonQuery ();

}

// -------------------------------------------------------------------
public static void mssql_insert_proc
	(SqlConnection conn,string id_a,string name,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, Name, Population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();

//	Console.WriteLine (str_sql);

	SqlCommand command = new SqlCommand (str_sql,conn);

	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}
}

// -------------------------------------------------------------------

}

// -------------------------------------------------------------------
