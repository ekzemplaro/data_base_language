#! /usr/bin/nodejs
//
//	sqlite3_create.js
//
//					Dec/26/2016
//
// ------------------------------------------------------------
var sqlite3 = require("sqlite3")
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate')

// ------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0711','郡山',91726,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0712','会津若松',23157,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0713','白河',68243,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0714','福島',31864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0715','喜多方',49358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0716','二本松',65192,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0717','いわき',38251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0718','相馬',52416,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0719','須賀川',26357,'1950-10-2')
	
	return	dict_aa
}

// ------------------------------------------------------------
function table_create_insert_proc (db,dict_aa)
{
	db.serialize (function () {
	db.run ("drop table cities")
	var command =  "create table cities (id varchar(10), name varchar(20),"
	command += " population int, date_mod date)"
	db.run (command)

	for (var key  in dict_aa)
		{
		var sql_str  = "insert into cities (id,name,population,date_mod) values ("

	var str_data = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

		sql_str += str_data
//			console.log (sql_str)
			db.run (sql_str)
			}
		})
}

// ------------------------------------------------------------
console.log ("*** 開始 ***")

const file_sqlite3 = process.argv[2]

console.log (file_sqlite3)

const dict_aa = data_prepare_proc ()

var db = new sqlite3.Database (file_sqlite3)

table_create_insert_proc (db,dict_aa)

db.close ()
console.log ("*** 終了 ***")
// ------------------------------------------------------------
