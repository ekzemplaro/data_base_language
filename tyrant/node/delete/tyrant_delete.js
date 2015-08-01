#! /usr/bin/nodejs
// -------------------------------------------------------------
//	tyrant_delete.js
//
//					Jul/09/2015
// -------------------------------------------------------------
var memcache = require('memcache');

// -------------------------------------------------------------
var onConnect = function()
{
	client.delete (key_in,function(error, result){ });

	client.close();

	console.log("*** 終了 ***");
};


// -------------------------------------------------------------
var key_in=process.argv[2];

console.log("*** 開始 ***");

console.log (key_in);

var client = new memcache.Client (1978,'ubuntu_1504');
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

