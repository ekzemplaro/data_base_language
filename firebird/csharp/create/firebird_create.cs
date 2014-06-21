// ----------------------------------------------------------------
/*
	firebird_create.cs

					Oct/25/2011

*/
// ----------------------------------------------------------------
using	System;
using	System.Text;
using	System.Collections.Generic;

using	FirebirdSql.Data.FirebirdClient;

// ----------------------------------------------------------------
public static class firebird_read
{
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string user = "sysdba";
	string passwd = "tiger";
	string dbname = "/var/tmp/firebird/cities.fdb";

        string ConnectionString = "User ID=" + user + ";Password="
		+ passwd + ";Database=" + dbname
		+ ";DataSource=localhost;Charset=NONE;";

	FbConnection conn = new FbConnection(ConnectionString);
	conn.Open(); 

	fbd_manipulate.table_drop_proc (conn);

	fbd_manipulate.table_create_proc (conn);

	fbd_manipulate.table_insert_proc (conn,dict_aa);

	fbd_manipulate.firebird_display_proc (conn);

	conn.Close(); 

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
// [2]:
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3821","松山",74125,"2009-1-8");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3822","今治",32687,"2009-2-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3823","宇和島",28392,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3824","八幡浜",53187,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3825","新居浜",81978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3826","西条",75647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3827","大洲",46786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3828","伊予",54535,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3829","西予",71324,"2009-10-12");

	return	dict_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
