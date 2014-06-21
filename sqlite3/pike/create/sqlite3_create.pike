#! /usr/bin/pike
//
//	sqlite3_create.pike
//
//						Dec/12/2011
//
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t0711","郡山","57285","1964-5-12");
	dict_aa =  dict_append_proc (dict_aa,"t0712","会津若松","56982","1964-8-5");
	dict_aa =  dict_append_proc (dict_aa,"t0713","白河","82761","1964-1-4");
	dict_aa =  dict_append_proc (dict_aa,"t0714","福島","39175","1964-2-9");
	dict_aa =  dict_append_proc (dict_aa,"t0715","喜多方","37924","1964-10-2");
	dict_aa =  dict_append_proc (dict_aa,"t0716","二本松","32867","1964-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t0717","いわき","25946","1964-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t0718","相馬","18536","1964-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t0719","須賀川","75421","1964-6-18");

	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_sqlite = argv[1];

	write (file_sqlite + "\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	object db = Sql.sqlite (file_sqlite);

	object res_aa = db->big_query ("drop table cities");

//	string sql_command = "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,population int,date_mod text)";

//	res_aa = db->big_query (sql_command);

	rows_insert_proc (db,dict_aa);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
void rows_insert_proc (object db,mapping(string:mapping(string:string)) dict_aa)
{
	array aa = indices (dict_aa);

	foreach (aa, string key)
		{
		display_proc (dict_aa, key);

		string sql_command = "insert into cities (id,name,population,date_mod)"
		+ "values ('" + key + "','"
		+ utf8_to_string (dict_aa[key]["name"]) + "',"
		+ dict_aa[key]["population"] +  ",'" + dict_aa[key]["date_mod"] + "')";
		object res_aa = db->big_query (sql_command);
		}
}

// ----------------------------------------------------------------
