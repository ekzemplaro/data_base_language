#! /usr/bin/node
// ---------------------------------------------------------------
//	maria_create.js
//
//					Apr/07/2015
//
// ---------------------------------------------------------------
var mysql = require('mysql')
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate')

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3321','岡山',491763,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3322','倉敷',183257,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3323','津山',975241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3324','玉野',231864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3325','笠岡',769358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3326','井原',865792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3327','総社',438251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3328','高梁',352486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3329','新見',126957,'1950-10-2')
	

	return	dict_aa
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var dict_aa = data_prepare_proc ()

var connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

connection.query ('drop table if exists cities')

var command = 'create table cities (id varchar(10), name varchar(20),'
command += ' population int, date_mod date)'
connection.query (command)

	for (var key  in dict_aa)
		{
		var sql_str  = "insert into cities (id,name,population,date_mod) values ("

	var str_data = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

		sql_str += str_data
			connection.query (sql_str)
			}
connection.end()

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
