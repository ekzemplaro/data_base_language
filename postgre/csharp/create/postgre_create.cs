// -------------------------------------------------------------------
/*
	postgre_create.cs

					Sep/28/2011

*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Npgsql;

// -------------------------------------------------------------------
class postgre_create
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");


	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=scott;Password=tiger;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	postgre_manipulate.table_drop_proc (str_connect);

	postgre_manipulate.table_create_proc (str_connect);

	DataTable dtable = table_manipulate.table_prepare_proc ();

	dtable = data_prepare_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
/* [6]: */
static DataTable data_prepare_proc
	 (string str_connect,DataTable dtable)
{
	dtable = data_row_proc
		(str_connect,dtable,"t3461",@"広島",25387,"2009-4-25");

	dtable = data_row_proc
		(str_connect,dtable,"t3462",@"福山",52146,"2009-7-9");

	dtable = data_row_proc
		(str_connect,dtable,"t3463",@"東広島",46291,"2009-9-19");

	dtable = data_row_proc
		(str_connect,dtable,"t3464",@"呉",75836,"2009-7-29");

	dtable = data_row_proc
		(str_connect,dtable,"t3465",@"尾道",46924,"2009-11-2");

	dtable = data_row_proc
		(str_connect,dtable,"t3466",@"竹原",71456,"2009-10-7");

	dtable = data_row_proc
		(str_connect,dtable,"t3467",@"三次",92391,"2009-9-9");

	dtable = data_row_proc
		(str_connect,dtable,"t3468",@"大竹",75843,"2009-8-16");

	dtable = data_row_proc
		(str_connect,dtable,"t3469",@"府中",71523,"2009-10-21");

	return	dtable;
}

// -------------------------------------------------------------------
/* [6-4]: */
static DataTable data_row_proc
	(string str_connect,DataTable dtable,
	string id_a,string name_a,int population_a,string str_date)
{
	DataRow drow = dtable.NewRow ();
	drow["ID"] = id_a;
	drow["NAME"] = name_a;
	drow["POPULATION"] = population_a.ToString ();
	drow["DATE_MOD"] = str_date;

	dtable.Rows.Add (drow);

	postgre_manipulate.insert_proc (str_connect,id_a,name_a,population_a,str_date);

	return	dtable;
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
