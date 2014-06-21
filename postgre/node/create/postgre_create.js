#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	postgre_create.js
//
//					May/21/2014
//
// ---------------------------------------------------------------
var pg = require('pg');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3461','広島',79425,'1950-8-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3462','福山',82197,'1950-2-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3463','東広島',65241,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3464','呉',37864,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3465','尾道',61358,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3466','竹原',65281,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3467','三次',31256,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3468','大竹',52981,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3469','府中',84736,'1950-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var str_connect = "tcp://scott:tiger@localhost:5432/city";

pg.connect (str_connect,function (error,client)
	{
	client.query('drop table cities');
	var command = 'create table cities (id varchar(10), name varchar(20),';
	command += ' population int, date_mod date)';
	var query = client.query(command);

	for (var key  in dict_aa)
		{
		var sql_str
		= "insert into cities (id,name,population,date_mod) values (";

		var str_data = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')";

		sql_str += str_data;
			query = client.query (sql_str);
		}

/*
	var query = client.query(command);
	query.on('row',function (row) {
		});

*/
	query.on('end',function () {
		client.end ();
		console.log ("*** 終了 ***");
		});

	});

// ---------------------------------------------------------------
