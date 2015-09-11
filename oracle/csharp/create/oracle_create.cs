// -------------------------------------------------------------------
/*
	oracle_create.cs

					Aug/17/2015


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.OracleClient;
using	System.Text;

// -------------------------------------------------------------------
class oracle_create
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string str_connect =
		"User Id=scott;Password=tiger;Data Source=oracle_home:1521/xe";

	OracleConnection connection = new OracleConnection (str_connect);

	Console.WriteLine ("*** pppp ***");
	connection.Open ();
	Console.WriteLine ("*** qqqq ***");
 
	oracle_manipulate.table_drop_proc (connection);
	Console.WriteLine ("*** ffff ***");
	oracle_manipulate.table_create_proc (connection);
	Console.WriteLine ("*** gggg ***");

	DataTable dtable = oracle_manipulate.oracle_data_fetch_proc
		(connection);

	Console.WriteLine ();

	data_prepare_proc (connection);

	connection.Close ();

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
static void data_prepare_proc (OracleConnection connection)
{
	insert_record_proc (connection,"t0131","函館",41537,"2009-3-18");
	insert_record_proc (connection,"t0132","札幌",37451,"2009-6-14");
	insert_record_proc (connection,"t0133","帯広",52542,"2009-5-7");
	insert_record_proc (connection,"t0134","釧路",33391,"2009-9-12");
	insert_record_proc (connection,"t0135","旭川",76198,"2009-8-19");
	insert_record_proc (connection,"t0136","北見",28795,"2009-1-21");
	insert_record_proc (connection,"t0137","室蘭",99854,"2009-2-24");
	insert_record_proc (connection,"t0138","根室",15476,"2009-5-22");
	insert_record_proc (connection,"t0139","稚内",67649,"2009-10-17");
}

// -------------------------------------------------------------------
static void	insert_record_proc
	(OracleConnection connection,
	String id,String name,int population,String date_mod)
{
	StringBuilder sb_sql = new StringBuilder
	("insert into cities (id, name, population, date_mod) values ('"
		+ id + "','"
		+ name + "',"
		+ population + ",'"
		+ date_mod + "')");

	String str_sql = sb_sql.ToString ();

	OracleCommand command = new OracleCommand (str_sql,connection);
	int rowsAffected = command.ExecuteNonQuery ();
	Console.WriteLine ("rowsAffected = " + rowsAffected);

}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
