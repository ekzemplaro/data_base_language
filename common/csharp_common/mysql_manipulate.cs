// -------------------------------------------------------------------
/*
	mysql_manipulate.cs

					Sep/17/2013

	csc mysql_command.cs -r:System.Data -r:MySql.Data.dll

*/
// -------------------------------------------------------------------
using	System;
using	System.Collections.Generic;
using	System.Data;
using	System.Text;
using	MySql.Data.MySqlClient;

// -------------------------------------------------------------------
public class mysql_manipulate
{
// -------------------------------------------------------------------
/* [4]: */
public static DataTable mysql_data_fetch_proc (MySqlConnection connection)
{
	string command = "SELECT id,name,population,date_mod FROM cities order by ID";

	MySqlDataAdapter da_adapter = new MySqlDataAdapter (command,connection);

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);

	return	dtable;
}

/* ------------------------------------------------------------------- */
/* [6]: */
public static void mysql_update_proc
	(MySqlConnection connection,string id_a,int population_a)
{
	DateTime dateNow = DateTime.Now;
	string str_date = dateNow.ToString ();

	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET population = "
			+ population_a + @" , date_mod = '" + str_date +
			@"' WHERE id = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	MySqlCommand command = new MySqlCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);
}

/* ------------------------------------------------------------------- */
public static void mysql_delete_proc
	(MySqlConnection connection,string id_a)
{
	StringBuilder sb_sql = new StringBuilder
			("DELETE from cities WHERE ID = '" + id_a + "'");

	string str_sql = sb_sql.ToString ();

	Console.WriteLine (str_sql);

	MySqlCommand command = new MySqlCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);
}

/* ------------------------------------------------------------------- */
public static void table_drop_proc (MySqlConnection connection)
{
	string sql_str_drop = "drop table cities";

	MySqlCommand command = new MySqlCommand (sql_str_drop,connection);
	command.ExecuteNonQuery ();
}

/* ------------------------------------------------------------------- */
public static void table_create_proc (MySqlConnection connection)
{
	string sql_str_create = "create TABLE cities ("
			+ "id varchar(10) NOT NULL PRIMARY KEY,"
			+ "name text,"
			+ "population int,"
			+ "date_mod text)";

	MySqlCommand command = new MySqlCommand (sql_str_create,connection);
	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
public static void dict_to_db_proc
	(Dictionary <string,Object> dict_aa,MySqlConnection connection)
{
	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

		int population = int.Parse (unit_aa["population"]);
		
		mysql_insert_proc
			(connection,kv.Key,unit_aa["name"],
			population,unit_aa["date_mod"]);
		}
}

// -------------------------------------------------------------------
public static void mysql_insert_proc
	(MySqlConnection connection,string id_a,string name,
	int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, name, population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();

//	Console.WriteLine (str_sql);

	MySqlCommand command = new MySqlCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
