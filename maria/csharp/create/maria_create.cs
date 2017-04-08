// -------------------------------------------------------------------
/*
	maria_create.cs

					Apr/08/2017

*/
// -------------------------------------------------------------------
using	System;
using	System.Collections.Generic;
using	MySql.Data.MySqlClient;

// -------------------------------------------------------------------
class mysql_create
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string server = "localhost";
	string str_db = "city";
	string user = "scott";
	string password = "tiger123";

	string str_connect = "Server=" + server + 
		";User Id=" + user + ";Password=" + password +
		";Database=" + str_db + ";";


	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();

	mysql_manipulate.table_drop_proc (connection);

	mysql_manipulate.table_create_proc (connection);

	mysql_manipulate.dict_to_db_proc (dict_aa,connection);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}


// -------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3321","岡山",437125,"2009-8-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3322","倉敷",219687,"2009-9-2");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3323","津山",871392,"2009-10-8");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3324","玉野",923187,"2009-5-9");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3325","笠岡",651978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3326","井原",395647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3327","総社",412786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3328","高梁",174835,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3329","新見",781324,"2009-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
