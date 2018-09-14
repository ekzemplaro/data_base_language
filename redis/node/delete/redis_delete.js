#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_delete.js
//
//					Sep/14/2018
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const key_in=process.argv[2]

console.log (key_in)

//
const redis = require ("redis")
const client = redis.createClient (6379,'localhost')

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
	})

client.del(key_in)

client.quit()
console.error ("*** 終了 ***")

// ---------------------------------------------------------------
