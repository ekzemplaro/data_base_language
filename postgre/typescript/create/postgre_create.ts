// ---------------------------------------------------------------
//	postgre_create.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var pg = require('pg');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3461','広島',43125,'2012-8-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3462','福山',26197,'2012-2-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3463','東広島',53241,'2012-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3464','呉',37164,'2012-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3465','尾道',62358,'2012-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3466','竹原',75281,'2012-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3467','三次',31256,'2012-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3468','大竹',52981,'2012-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3469','府中',84736,'2012-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var str_connect = "tcp://scott:tiger@localhost:5432/city";

pg.connect (str_connect,function (error,client)
	{
	client.query('drop table cities');
	var command: string = 'create table cities (id varchar(10), name varchar(20),';
	command += ' population int, date_mod date)';
	var query = client.query(command);

	for (var key  in dict_aa)
		{
		var sql_str: string
		= "insert into cities (id,name,population,date_mod) values (";

		var str_data: string = "'" + key + "','" + dict_aa[key].name + "',"
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
