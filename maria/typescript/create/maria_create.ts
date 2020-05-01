// ---------------------------------------------------------------
//	maria_create.ts
//
//					May/01/2018
//
// ---------------------------------------------------------------
var mysql = require('mysql')
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate')
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3321','岡山',491763,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3322','倉敷',183257,'2012-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3323','津山',975241,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3324','玉野',231864,'2012-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3325','笠岡',769358,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3326','井原',865792,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3327','総社',438251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3328','高梁',352486,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3329','新見',126957,'2012-10-2')
	

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

var command: string = 'create table cities (id varchar(10), name varchar(20),'
command += ' population int, date_mod date)'
connection.query (command)

	for (var key  in dict_aa)
		{
		var sql_str: string  = "insert into cities (id,name,population,date_mod) values ("

	var str_data: string = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

		sql_str += str_data
			connection.query (sql_str)
			}
connection.end()

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
