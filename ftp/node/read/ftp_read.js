#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	ftp_read.js
//
//					Apr/24/2013
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
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
console.log ("*** 開始 ***");

var ftp = require('ftp');
var util = require('util');

var conn = new ftp ({host: 'host_dbase'});

conn.on('connect', function()
	{
	conn.auth('scott','tiger',function (ee)
		{
		if (ee)
			throw ee;

		ftp_get_proc (conn);

		});
});

conn.connect();

// ---------------------------------------------------------------
