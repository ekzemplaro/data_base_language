// ---------------------------------------------------------------
//	mssql_create.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var mssql = require('mssql');
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1071','前橋',41763,'2012-2-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1072','高崎',39457,'2012-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1073','桐生',53641,'2012-10-19');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1074','沼田',32864,'2012-8-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1075','伊勢崎',79158,'2012-5-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1076','水上',68792,'2012-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1077','太田',39251,'2012-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1078','安中',52186,'2012-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1079','みどり',26957,'2012-10-2');
	

	return	dict_aa;
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var config = {
	user: 'sa',
	password: 'Tiger123',
	server: 'host_mssql\\EG',
	database: 'city',
}

var connection = new mssql.Connection (config, function (err)
	{
	var request = new mssql.Request(connection);

	request.query ('drop table cities');

	var command: string = 'create table cities (id varchar(10), name varchar(20),';
	command += ' population int, date_mod date)';

request.query (command, function (err, rows)
	{
	for (var key in dict_aa)
		{
console.log (key);
		var sql_str: string  = "insert into cities ";
		sql_str += "(id,name,population,date_mod) values (";

		var str_data: string = "'" + key + "','" + dict_aa[key].name;
		str_data += "'," + dict_aa[key].population;
		str_data += ",'" + dict_aa[key].date_mod + "')";

		sql_str += str_data;
			request.query (sql_str);
		}

	connection.close ();
	console.log ("*** 終了 ***");
	});
});


// ---------------------------------------------------------------
