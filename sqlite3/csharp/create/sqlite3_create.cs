// -------------------------------------------------------------------
/*
	sqlite3_create.cs

					Aug/25/2015

*/
// -------------------------------------------------------------------
using	System;
using	System.Text;
using	System.Collections.Generic;
using	Mono.Data.Sqlite;

// -------------------------------------------------------------------
class sqlite3_create
{
// -------------------------------------------------------------------
static int Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	if (args.Length < 1)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string file_sqlite3 = args[0];

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_connect = @"Data Source = " + file_sqlite3
			+ ";UTF8Encoding=True;Version=3";

	SqliteConnection conn = new SqliteConnection (str_connect);

	conn.Open ();
	table_drop_proc (conn);

	table_create_proc (conn);

	table_insert_proc (conn,dict_aa);
	conn.Close ();

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// -------------------------------------------------------------------
/* [4]: */
static void table_drop_proc (SqliteConnection conn)
{
	string sql_str_drop = "drop table cities";

	SqliteCommand command = new SqliteCommand (sql_str_drop,conn);
	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
/* [6]: */
static void table_create_proc (SqliteConnection conn)
{
	string sql_str_create = "create TABLE cities ("
			+ "ID varchar(10) NOT NULL PRIMARY KEY,"
			+ "NAME text,"
			+ "POPULATION int,"
			+ "DATE_MOD text)";

	SqliteCommand command = new SqliteCommand (sql_str_create,conn);
	command.ExecuteNonQuery ();
}

// -------------------------------------------------------------------
/* [8]: */
static void table_insert_proc
	 (SqliteConnection conn,Dictionary <string,Object> dict_aa)
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
static void sql_insert_proc
	(SqliteConnection conn,string id_a,string name,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, Name, Population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();

	SqliteCommand command = new SqliteCommand (str_sql,conn);
	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}
}

// -------------------------------------------------------------------
/* [2]: */
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0711","郡山",47125,"2009-1-8");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0712","会津若松",32681,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0713","白河",73592,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0714","福島",53187,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0715","喜多方",41978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0716","二本松",35647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0717","いわき",41786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0718","相馬",94135,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0719","須賀川",71324,"2009-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
