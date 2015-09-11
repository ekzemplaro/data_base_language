// -------------------------------------------------------------------
/*
	mssql_create.cs

						Aug/24/2015


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



	try
		{

		SqlConnection conn = new SqlConnection (str_connect);

		conn.Open ();

	mssql_manipulate.table_drop_proc (conn);
	mssql_manipulate.table_create_proc (conn);
	DataTable dtable = table_manipulate.table_prepare_proc ();

	dtable = data_prepare_proc (conn,dtable);

		conn.Close ();
		}
	catch (NotSupportedException ex)
		{
		Console.WriteLine ("*** NotSupportedException ***");
		Console.WriteLine ("*** message ***");
		Console.WriteLine (ex);
		Console.WriteLine ("*** message ***");
		}

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
/* [6]: */
static DataTable data_prepare_proc
	 (SqlConnection conn,DataTable dtable)
{
	dtable = data_row_proc
		(conn,dtable,"t1071",@"前橋",31276,"2009-5-25");

	dtable = data_row_proc
		(conn,dtable,"t1072",@"高崎",46781,"2009-3-21");

	dtable = data_row_proc
		(conn,dtable,"t1073",@"桐生",73862,"2009-7-29");

	dtable = data_row_proc
		(conn,dtable,"t1074",@"沼田",46297,"2009-11-2");

	dtable = data_row_proc
		(conn,dtable,"t1075",@"伊勢崎",71326,"2009-10-7");

	dtable = data_row_proc
		(conn,dtable,"t1076",@"水上",92613,"2009-9-9");

	dtable = data_row_proc
		(conn,dtable,"t1077",@"太田",12584,"2009-8-16");

	dtable = data_row_proc
		(conn,dtable,"t1078",@"安中",61752,"2009-10-11");

	dtable = data_row_proc
		(conn,dtable,"t1079",@"みどり",45178,"2009-5-22");
	return	dtable;
}

// -------------------------------------------------------------------
/* [6-4]: */
static DataTable data_row_proc
	(SqlConnection conn,DataTable dtable,
	string id_a,string name_a,int population_a,string str_date)
{
	DataRow drow = dtable.NewRow ();
	drow["ID"] = id_a;
	drow["NAME"] = name_a;
	drow["POPULATION"] = population_a.ToString ();
	drow["DATE_MOD"] = str_date;

	dtable.Rows.Add (drow);

	mssql_manipulate.mssql_insert_proc (conn,id_a,name_a,population_a,str_date);

	return	dtable;
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

