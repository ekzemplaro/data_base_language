// -------------------------------------------------------------------
/*
	sqlite3_create.cs

					Jun/13/2014


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

	table_drop_proc (str_connect);

	table_create_proc (str_connect);

	table_insert_proc (str_connect,dict_aa);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// -------------------------------------------------------------------
/* [4]: */
static void table_drop_proc (string str_connect)
{
	string sql_str_drop = "drop table cities";

	SqliteConnection connection = new SqliteConnection (str_connect);

	SqliteCommand command = new SqliteCommand (sql_str_drop,connection);
	connection.Open ();
	command.ExecuteNonQuery ();
	connection.Close ();
}

// -------------------------------------------------------------------
/* [6]: */
static void table_create_proc (string str_connect)
{
	string sql_str_create = "create TABLE cities ("
			+ "ID varchar(10) NOT NULL PRIMARY KEY,"
			+ "NAME text,"
			+ "POPULATION int,"
			+ "DATE_MOD text)";


	SqliteConnection connection = new SqliteConnection (str_connect);

	SqliteCommand command = new SqliteCommand (sql_str_create,connection);
	connection.Open ();
	command.ExecuteNonQuery ();

	connection.Close ();
}

// -------------------------------------------------------------------
/* [8]: */
static void table_insert_proc
	 (string str_connect,Dictionary <string,Object> dict_aa)
{
	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

		sql_insert_proc (str_connect,kv.Key,unit_aa["name"],
			int.Parse (unit_aa["population"]),
			unit_aa["date_mod"]);
		}
}

// -------------------------------------------------------------------
/* [8-4]: */
static void sql_insert_proc
	(string str_connect,string id_a,string name,int population_a,string str_date)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, Name, Population, date_mod) values ('"
		+ id_a + "','"
		+ name + "',"
		+ population_a + ",'"
		+ str_date + "')");

	string str_sql = sb_sql.ToString ();

//	Console.WriteLine (str_sql);

	SqliteConnection connection = new SqliteConnection (str_connect);
	SqliteCommand command = new SqliteCommand (str_sql,connection);
	connection.Open ();
	int rowsAffected = command.ExecuteNonQuery ();

	if (rowsAffected < 1)
		{
		Console.WriteLine ("rowsAffected = " + rowsAffected);
		}

	connection.Close ();
}

// -------------------------------------------------------------------
/* [2]: */
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0711","郡山",48125,"2009-1-8");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0712","会津若松",32687,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0713","白河",23592,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0714","福島",53187,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0715","喜多方",81978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0716","二本松",75647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0717","いわき",46786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0718","相馬",54535,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0719","須賀川",71324,"2009-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
