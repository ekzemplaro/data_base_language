#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_list.js
//
//					Jan/17/2020
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//
const redis = require("redis")
const client = redis.createClient(6379,'localhost')

client.on ("error", function (err)
	{
        console.log ("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
	})

client.keys ('*',function (err, reply)
	{
	if (err)
		{
		console.log("Get error: " + err)
        	}
	 else if (reply != null)
		{
		const keys = reply

		console.log (keys)
	console.log("keys.length = " + keys.length)
		console.log (keys[0])
		}

	client.quit()
	console.error ("*** 終了 ***")
	})

// ---------------------------------------------------------------
