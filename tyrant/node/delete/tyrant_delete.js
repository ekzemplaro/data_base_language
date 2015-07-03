#! /usr/bin/nodejs
// -------------------------------------------------------------
//	tyrant_delete.js
//
//					Jun/01/2015
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

var client = new memcache.Client (1978,'host_ubuntu1');
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

