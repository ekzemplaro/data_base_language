#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_create.js
//
//					Aug/08/2013
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
var redis = require("redis"),
//client = redis.createClient();
client = redis.createClient(6379,'host_dbase');

client.on("error", function (err) {
        console.log("Redis connection error to " + client.host + ":" + client.port + " - " + err);
    });

client.set('t1851', '{"name":"福井","population":41536,"date_mod":"1950-12-20"}', redis.print);
client.set('t1852', '{"name":"敦賀","population":34298,"date_mod":"1950-3-8"}', redis.print);
client.set('t1853', '{"name":"小浜","population":75326,"date_mod":"1950-9-12"}', redis.print);
client.set('t1854', '{"name":"大野","population":32715,"date_mod":"1950-6-18"}', redis.print);
client.set('t1855', '{"name":"勝山","population":62158,"date_mod":"1950-11-15"}' , redis.print);
client.set('t1856', '{"name":"鯖江","population":42975,"date_mod":"1950-5-12"}'
 , redis.print);
client.set('t1857', '{"name":"あわら","population":52836,"date_mod":"1950-2-14"}'
, redis.print);
client.set('t1858', '{"name":"越前","population":34251,"date_mod":"1950-1-19"}', redis.print);
client.set('t1859', '{"name":"坂井","population":62457,"date_mod":"1950-7-11"}'
, redis.print);


var keys=["t1851","t1852","t1853"]
for (var it in keys)
{
client.get(keys[it], redis.print);
}

client.quit();
console.log ("*** 終了 ***");

// ---------------------------------------------------------------
