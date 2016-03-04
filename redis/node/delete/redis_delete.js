#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_delete.js
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
var key_in=process.argv[2]

console.log (key_in)

//
var redis = require ("redis")
var client = redis.createClient (6379,'host_dbase')

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
	})

client.del(key_in)

client.quit()
console.log ("*** 終了 ***")

// ---------------------------------------------------------------
