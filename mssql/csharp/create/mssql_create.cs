// -------------------------------------------------------------------
/*
	mssql_create.cs

				Oct/01/2013


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	System.Data.SqlClient;

// -------------------------------------------------------------------
class mssql_create
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string str_connect =
		@"server=host_mssql;"
		+ "uid=sa;" + "pwd=scott_tiger;" + "database=city;";

	mssql_manipulate.table_drop_proc (str_connect);

	mssql_manipulate.table_create_proc (str_connect);

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
		(str_connect,dtable,"t1071",@"前橋",39276,"2009-9-25");

	dtable = data_row_proc
		(str_connect,dtable,"t1072",@"高崎",46781,"2009-3-21");

	dtable = data_row_proc
		(str_connect,dtable,"t1073",@"桐生",75862,"2009-7-29");

	dtable = data_row_proc
		(str_connect,dtable,"t1074",@"沼田",46237,"2009-11-2");

	dtable = data_row_proc
		(str_connect,dtable,"t1075",@"伊勢崎",71326,"2009-10-7");

	dtable = data_row_proc
		(str_connect,dtable,"t1076",@"水上",92613,"2009-9-9");

	dtable = data_row_proc
		(str_connect,dtable,"t1077",@"太田",12584,"2009-8-16");

	dtable = data_row_proc
		(str_connect,dtable,"t1078",@"安中",61752,"2009-10-11");

	dtable = data_row_proc
		(str_connect,dtable,"t1079",@"みどり",45178,"2009-5-22");
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

	mssql_manipulate.mssql_insert_proc (str_connect,id_a,name_a,population_a,str_date);

	return	dtable;
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

