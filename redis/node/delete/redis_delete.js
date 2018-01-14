#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_delete.js
//
//					Jan/03/2018
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
const key_in=process.argv[2]

console.log (key_in)

//
var redis = require ("redis")
var client = redis.createClient (6379,'localhost')

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
	})

client.del(key_in)

client.quit()
console.log ("*** 終了 ***")

// ---------------------------------------------------------------
