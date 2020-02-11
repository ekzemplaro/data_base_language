#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_read.js
//
//					Sep/14/2018
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
	

console.log("keys.length = " + keys.length)
keys.forEach(function(key,index)
	{
	read_single_proc (client,key,index)
	if (keys.length === (index + 1))
		{
		client.quit()
		}
	})
		console.error ("*** 終了 ***")
	}
	})

// ---------------------------------------------------------------
function read_single_proc (client,key,index)
{
	client.get (key, function (err, reply)
	{
	if (err)
		{
		console.log("Get error: " + err)
        	}
	 else if (reply != null)
		{
		const json_str = reply
		const data = JSON.parse (json_str)

		var out_str = key + "\t"
		out_str  += data.name + "\t"
		out_str += data.population + "\t"
		out_str += data.date_mod
		console.log (out_str)
		}


	})
}

// ---------------------------------------------------------------
