#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_read.js
//
//					Aug/03/2017
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var redis = require("redis")
var client = redis.createClient(6379,'localhost')

client.on ("error", function (err)
{
        console.log ("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
})

var keys=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]

console.log("keys.length = " + keys.length)

keys.forEach(function(key,index)
	{
	read_single_proc (client,key,index)
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
		var json_str = reply
		var data = JSON.parse (json_str)

		var out_str = key + "\t"
		out_str  += data.name + "\t"
		out_str += data.population + "\t"
		out_str += data.date_mod
		console.log (out_str)
		}

	if (keys.length === (index + 1))
		{
		client.quit()
		console.log ("*** 終了 ***")
		}
	})
}

// ---------------------------------------------------------------
