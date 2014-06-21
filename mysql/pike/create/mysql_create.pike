#! /usr/bin/pike
//
//	mysql_create.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t3321","岡山","51485","1920-5-12");
	dict_aa =  dict_append_proc (dict_aa,"t3322","倉敷","56982","1920-8-5");
	dict_aa =  dict_append_proc (dict_aa,"t3323","津山","82761","1920-1-4");
	dict_aa =  dict_append_proc (dict_aa,"t3324","玉野","39175","1920-2-9");
	dict_aa =  dict_append_proc (dict_aa,"t3325","笠岡","37924","1920-10-2");
	dict_aa =  dict_append_proc (dict_aa,"t3326","井原","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t3327","総社","25946","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t3328","高梁","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t3329","新見","75421","1920-6-18");

	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	object db = Mysql.mysql ("host_mysql", "city", "scott", "tiger");

	object res_aa = db->big_query ("SET NAMES utf8");
	res_aa = db->big_query ("drop table cities");

	string sql_command = "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,population int,date_mod text)";

	res_aa = db->big_query (sql_command);

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
		display_record_proc (dict_aa, key);

		string sql_command = "insert into cities (id,name,population,date_mod)"
		 + "values ('" + key + "','" + dict_aa[key]["name"] + "',"
		+ dict_aa[key]["population"] +  ",'" + dict_aa[key]["date_mod"] + "')";
		object res_aa = db->big_query (sql_command);
		}
}

// ----------------------------------------------------------------
