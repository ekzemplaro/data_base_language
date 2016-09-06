#! /usr/bin/pike
//
//	maria_create.pike
//
//						Sep/06/2016
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t3321","岡山","751485","1920-5-12");
	dict_aa =  dict_append_proc (dict_aa,"t3322","倉敷","456982","1920-8-5");
	dict_aa =  dict_append_proc (dict_aa,"t3323","津山","982761","1920-1-4");
	dict_aa =  dict_append_proc (dict_aa,"t3324","玉野","839175","1920-2-9");
	dict_aa =  dict_append_proc (dict_aa,"t3325","笠岡","637924","1920-10-2");
	dict_aa =  dict_append_proc (dict_aa,"t3326","井原","432867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t3327","総社","125946","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t3328","高梁","718536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t3329","新見","675421","1920-6-18");

	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();


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
		string sql_command = "insert into cities (id,name,population,date_mod)"
		 + "values ('" + key + "','" + dict_aa[key]["name"] + "',"
		+ dict_aa[key]["population"] +  ",'" + dict_aa[key]["date_mod"] + "')";
		object res_aa = db->big_query (sql_command);
		}
}

// ----------------------------------------------------------------
