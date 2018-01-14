#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_update.js
//
//					Jan/03/2018
//
// ---------------------------------------------------------------
var node_common = '/var/www/data_base/common/node_common'

var text_manipulate=require (node_common + '/text_manipulate')

// ---------------------------------------------------------------
console.log ("*** 開始 ***")
const key_in=process.argv[2]
const population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

//
var redis = require ("redis")
var client = redis.createClient (6379,'localhost')

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
	})

redis_update_proc (client,key_in,population_in)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
function redis_update_proc (client,key_in,population_in)
{
client.get (key_in, function (err, reply)
	{
	if (err)
		{
		console.log("Get error: " + err)
        	}
	 else if (reply != null)
		{
		var json_str = reply

		var unit_aa = JSON.parse (json_str)

		unit_aa.population = population_in
		unit_aa.date_mod =  text_manipulate.get_current_date_proc ()
		var json_out = JSON.stringify (unit_aa)

		console.log (json_out)

		client.set (key_in,json_out, redis.print)
		client.quit()
		}
	})

}

// ---------------------------------------------------------------
