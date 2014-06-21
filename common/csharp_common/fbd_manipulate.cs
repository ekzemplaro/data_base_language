// ----------------------------------------------------------------
/*
	fbd_manipulate.cs

					Nov/14/2011

*/
// ----------------------------------------------------------------
using	System;
using	System.Text;
using	System.Collections.Generic;

using	FirebirdSql.Data.FirebirdClient;

// ----------------------------------------------------------------
public static class fbd_manipulate
{

// ----------------------------------------------------------------
/* [4]: */
public static void table_drop_proc (FbConnection conn)
{
	string sql_str_drop = "drop table cities";

	FbCommand command = new FbCommand (sql_str_drop,conn);
	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
/* [6]: */
public static void table_create_proc (FbConnection conn)
{
	string sql_str_create = "create TABLE cities ("
			+ "ID varchar(10) NOT NULL PRIMARY KEY,"
			+ "NAME varchar(20),"
			+ "POPULATION int,"
			+ "DATE_MOD date)";


	FbCommand command = new FbCommand (sql_str_create,conn);
	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
/* [8]: */
public static void table_insert_proc
	 (FbConnection conn,Dictionary <string,Object> dict_aa)
{
	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

		sql_insert_proc (conn,kv.Key,unit_aa["name"],
			int.Parse (unit_aa["population"]),
			unit_aa["date_mod"]);
		}
}

// -------------------------------------------------------------------
/* [8-4]: */
public static void sql_insert_proc
	(FbConnection conn,string id_a,string name,
	int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, Name, Population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();

//	Console.WriteLine (str_sql);

	FbCommand command = new FbCommand (str_sql,conn);
	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}
}

// ----------------------------------------------------------------
/* [10]: */
public static void firebird_display_proc (FbConnection conn)
{
	string str_sql = "select id,name,population,date_mod from cities";

	FbCommand cmd = new FbCommand (str_sql,conn);

	FbDataReader dr = cmd.ExecuteReader();

	while(dr.Read())
                {
                for (int it = 0; it < dr.FieldCount; it++)
                        {
                        Console.Write("{0} \t", dr[it]);
                        }
                Console.WriteLine();
                }
}


// ----------------------------------------------------------------
/* [12]: */
public static void update_proc
	(FbConnection conn,string id_in,int population_in)
{
	DateTime dateNow = DateTime.Now;
	string str_date_aa = dateNow.ToString ();
	char [] delimeters = new char [] {' ','\t'};
	string [] cols = str_date_aa.Split (delimeters);
	string str_date = cols[0];
	
	StringBuilder sb_sql = new StringBuilder
			("UPDATE cities SET POPULATION = "
			+ population_in.ToString () + @" , DATE_MOD = '" + str_date +
			@"' WHERE ID = '" + id_in + "'");

	string str_sql = sb_sql.ToString ();

	FbCommand cmd = new FbCommand (str_sql, conn);

	cmd.ExecuteNonQuery();
}

// ----------------------------------------------------------------
/* [12]: */
public static void delete_proc (FbConnection conn,string id_in)
{
	StringBuilder sb_sql = new StringBuilder
			("delete from cities WHERE ID = '" + id_in + "'");

	string str_sql = sb_sql.ToString ();

	FbCommand cmd = new FbCommand (str_sql, conn);

	cmd.ExecuteNonQuery();
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
