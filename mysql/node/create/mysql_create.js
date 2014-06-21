#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	mysql_create.js
//
//					May/09/2013
//
// ---------------------------------------------------------------
var mysql = require('mysql');
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3321','岡山',91763,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3322','倉敷',83257,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3323','津山',75241,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3324','玉野',31864,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3325','笠岡',69358,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3326','井原',65792,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3327','総社',38251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3328','高梁',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3329','新見',26957,'1950-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var dict_aa = data_prepare_proc ();
text_manipulate.dict_display_proc (dict_aa);

var connection = mysql.createClient ({
	host: 'host_dbase',
	user: 'scott',
	password: 'tiger'
	});

connection.query ('Use city');

connection.query ('drop table if exists cities');

var command = 'create table cities (id varchar(10), name varchar(20),';
command += ' population int, date_mod date)';
connection.query (command);

	for (var key  in dict_aa)
		{
		var sql_str  = "insert into cities (id,name,population,date_mod) values (";

	var str_data = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')";

		sql_str += str_data;
			connection.query (sql_str);
			}
connection.end();

console.log ("*** 終了 ***");
// ---------------------------------------------------------------
