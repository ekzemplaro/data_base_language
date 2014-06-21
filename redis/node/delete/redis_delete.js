#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_delete.js
//
//					Aug/08/2013
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var id_in=process.argv[2];

console.log (id_in);

//
var redis = require("redis"),
//client = redis.createClient();
client = redis.createClient(6379,'host_dbase');

client.on("error", function (err)
	{
	console.log("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err);
	});

client.del(id_in);

var keys=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]
for (var key in keys)
{
client.get(key, redis.print);
}

client.quit();
console.log ("*** 終了 ***");

// ---------------------------------------------------------------
