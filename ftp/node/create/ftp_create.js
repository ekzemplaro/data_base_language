#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	ftp_create.js
//
//					Dec/23/2013
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
function data_prepare_proc ()
{
		var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2381','名古屋',93714,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2382','豊橋',23157,'1950-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2383','岡崎',65241,'1950-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2384','一宮',31864,'1950-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2385','蒲郡',49358,'1950-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2386','常滑',65792,'1950-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2387','大府',38251,'1950-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2388','瀬戸',52486,'1950-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2389','犬山',26857,'1950-10-2');
	
	return	dict_aa;
}

// ---------------------------------------------------------------
function ftp_get_proc (conn)
{
conn.get ('city/iwate.json', function(ee, stream)
	{
	if (ee)
		throw ee;

	stream.on('success', function() {
		conn.end();
		});

	stream.on('error', function(e) {
		console.log('ERROR during get(): ' + util.inspect(e));
		conn.end();
		});

	stream.on('data', function(data) {
		console.log ("*** data ***");
		var dict_aa = JSON.parse (data);
		text_manipulate.dict_display_proc (dict_aa);
		conn.end();
		console.log ("*** 終了 ***");
		});
	});
}

// ---------------------------------------------------------------
var ftp = require('ftp');
var util = require('util');
var fs = require('fs');

console.log ("*** 開始 ***");

file_tmp = "tmp001.json";

dict_aa = data_prepare_proc ();
var json_str = JSON.stringify(dict_aa);

fs.writeFileSync (file_tmp,json_str);

console.log ("*** aaaa ***");

var conn = new ftp (
	{
	host: 'host_dbase',
	user: 'scott',
	password: 'tiger'
	}
	);
console.log ("*** bbbb ***");
// conn.on('connect', function() {
conn.on('ready', function() {
	console.log ("*** cccc ***");
//	conn.auth('scott','tiger',function (ee)
//		{
		console.log ("*** dddd ***");
//		if (ee) throw ee;

		console.log ("*** eeee ***");
//		conn.put (file_tmp, 'city/iwate.json', function (err)
		conn.put (file_tmp, 'iwate.json', function (err)
			{
			console.log ("*** ffff ***");
			if (err) throw err;
			conn.end();
			});
//		});
});

conn.connect();

// ---------------------------------------------------------------
