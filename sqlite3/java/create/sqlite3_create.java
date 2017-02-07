// ---------------------------------------------------------------------
/*
	java/create/sqlite3_create.java

					Nov/28/2014

*/
// ---------------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import	SQLite.*;
// ---------------------------------------------------------------------
public class sqlite3_create
{
// ---------------------------------------------------------------------
public static void main (String args [])
{
	System.out.println ("*** 開始 ***");

	String sqlite3_file = args[0];

	HashMap <String, HashMap <String,String>> dict_aa
			= data_prepare_proc ();

	SQLite.Database db = new SQLite.Database();

	try
	{
	db.open(sqlite3_file, 0666);

	do_exec (db,"drop table cities");

	String sql_command = "create table cities (id varchar(10),"
		+ "name varchar(20),"
		+ " population int, date_mod date)";

	do_exec (db,sql_command);

	dict_to_db_proc (dict_aa,db);

	db.close();
	}
	catch (SQLite.Exception ee)
		{
		ee.printStackTrace();
		}

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
static void insert_record_proc (SQLite.Database db,
	String id,String name,int population,String date_mod)
	throws SQLite.Exception
{
	String str_ins
		= "insert into cities (id,name,population,date_mod) values (";

	String str_data = "'" + id + "','" + name + "',"
		+ Integer.toString (population) + ",'" + date_mod + "')";

	String sql_str = str_ins + str_data;

//	System.out.println ("sql_str = " + sql_str);

	do_exec (db,sql_str);
}

// ----------------------------------------------------------------------
static void dict_to_db_proc (HashMap <String, HashMap<String,String>> dict_aa,
	SQLite.Database db)
	throws SQLite.Exception
{
	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key);
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String date_mod = dict_unit.get ("date_mod");
		insert_record_proc (db,key,name,population,date_mod);
		}
}

// ---------------------------------------------------------------------
static void do_exec(SQLite.Database db, String sql) throws SQLite.Exception
{
	SQLite.Stmt stmt = db.prepare(sql);
	while (stmt.step()) {
	}
	stmt.close();
}

// ---------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0711","郡山",92876,"2008-10-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0712","会津若松",43159,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0713","白河",97253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0714","福島",81624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0715","喜多方",74531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0716","二本松",27539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0717","いわき",31457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0718","相馬",47315,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0719","須賀川",56174,"2008-10-24");

	return	dict_aa;
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

