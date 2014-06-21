#! /usr/bin/nodejs
// -------------------------------------------------------------
//	mcachedb_delete.js
//
//					Mar/07/2013
// -------------------------------------------------------------
var memcache = require('memcache');

// -------------------------------------------------------------
var onConnect = function()
{
	console.log("*** 開始 ***");

	client.delete (key_in,function(error, result){ });

	client.close();

	console.log("*** 終了 ***");
};


// -------------------------------------------------------------
var key_in=process.argv[2];

console.log (key_in);

var client = new memcache.Client (21201,'localhost');
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

