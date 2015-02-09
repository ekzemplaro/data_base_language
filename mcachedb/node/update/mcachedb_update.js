#! /usr/bin/nodejs
// -------------------------------------------------------------
//	mcached_update.js
//
//					Feb/02/2015
// -------------------------------------------------------------
var memcache = require('memcache');
var node_common = '/var/www/data_base/common/node_common';

var text_manipulate=require (node_common + '/text_manipulate');
var json_manipulate=require (node_common + '/json_manipulate');

// -------------------------------------------------------------
function set_proc (client,key,value)
{
//	client.set(key, value,function(error, result){ }, 3600);
	client.set  (key,value,function (error,result){ });
}

// -------------------------------------------------------------
function update_proc (client,key,population)
{
	client.get (key,function(error,reply)
		{
		if (!error)
			{
			if (reply != null)
				{
//				var json_out = update_proc_exec (key,population,reply);
				var json_out = json_manipulate.json_update_proc (reply,population);
				console.log ("*** new *** " + json_out);
				set_proc  (client,key,json_out);
				}
			}
		client.close();
		console.log("*** 終了 ***");
		});
}

// -------------------------------------------------------------
var onConnect = function()
{

	update_proc (client,key_in,population_in);

};

// -------------------------------------------------------------
var key_in=process.argv[2];
var population_in=process.argv[3];

console.log("*** 開始 ***");
console.log (key_in + "\t" + population_in);

var hostname = 'host_ubuntu1';
var client = new memcache.Client (21201,hostname);
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

