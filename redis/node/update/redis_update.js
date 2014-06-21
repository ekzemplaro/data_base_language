#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_update.js
//
//					Aug/09/2013
//
// ---------------------------------------------------------------
var node_common = '/var/www/data_base/common/node_common';

var text_manipulate=require (node_common + '/text_manipulate');
var json_manipulate=require (node_common + '/json_manipulate');

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var id_in=process.argv[2];
var population_in=process.argv[3];

console.log (id_in + "\t" + population_in);

//
var redis = require("redis"),
//client = redis.createClient();
client = redis.createClient(6379,'host_dbase');

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err);
	});


	update_proc (client,id_in,population_in);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
function update_proc (client,id_in,population_in)
{
client.get (id_in, function (err, reply)
	{
	if (err)
		{
		console.log("Get error: " + err);
        	}
	 else if (reply != null)
		{
		var json_str = reply;

		var json_out = json_manipulate.json_update_proc (json_str,population_in);

		console.log (json_out);

		client.set (id_in,json_out, redis.print);
		client.quit();
		}
	});

}

// ---------------------------------------------------------------
