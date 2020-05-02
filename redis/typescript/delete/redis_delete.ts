// ---------------------------------------------------------------
//	redis_delete.ts
//
//					May/02/2020
//
// ---------------------------------------------------------------
var redis = require ("redis")

console.log ("*** 開始 ***")
var key_in=process.argv[2]

console.log (key_in)

//
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
