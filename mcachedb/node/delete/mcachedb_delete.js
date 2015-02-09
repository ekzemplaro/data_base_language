#! /usr/bin/nodejs
// -------------------------------------------------------------
//	mcachedb_delete.js
//
//					Feb/02/2015
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

var hostname = 'host_ubuntu1';
var client = new memcache.Client (21201,hostname);
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

