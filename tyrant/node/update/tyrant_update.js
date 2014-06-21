#! /usr/bin/nodejs
// -------------------------------------------------------------
//	tyrant_update.js
//
//					Aug/09/2013
// -------------------------------------------------------------
var memcache = require('memcache');
var node_common = '/var/www/data_base/common/node_common';

var text_manipulate=require (node_common + '/text_manipulate');
var json_manipulate=require (node_common + '/json_manipulate');

// -------------------------------------------------------------
function update_proc_exec (key,population,value)
{
	var out_str = key + "\t";
	var data = eval('('+value+')');
	out_str  += data.name + "\t";
	out_str += data.population + "\t";
	out_str += data.date_mod;
	console.log (out_str);

	var unit_aa = {};
	unit_aa['name'] = data.name;
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = text_manipulate.get_current_date_proc ();

	var json_out = JSON.stringify (unit_aa);

	return	json_out;
}

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
				var json_out = json_manipulate.json_update_proc (reply,population);
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
console.log("*** 開始 ***");
var key_in=process.argv[2];
var population_in=process.argv[3];

console.log (key_in + "\t" + population_in);

var client = new memcache.Client (1978,'localhost');
client.connect();
client.addHandler(onConnect);

// -------------------------------------------------------------

