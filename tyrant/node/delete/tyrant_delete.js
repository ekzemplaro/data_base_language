#! /usr/bin/nodejs
// -------------------------------------------------------------
//	tyrant_delete.js
//
//					Apr/24/2013
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

var client = new memcache.Client (1978,'localhost');
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

