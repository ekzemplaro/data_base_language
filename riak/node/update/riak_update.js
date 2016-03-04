#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	riak_update.js
//
//					Feb/25/2016
// ---------------------------------------------------------------
var http = require('http')
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate')
// ---------------------------------------------------------------
function riak_update_proc (key_in,population_in)
{
	var host_server = 'host_ubuntu'

	var path_target = '/riak/shimane/'+ key_in

	var options = {
		host: host_server,
		port: 8098,
		path: path_target
	}


	http.get(options, function(res)
		{
		console.log("Got response: " + res.statusCode)
		// console.log('HEADERS: ' + JSON.stringify(res.headers))
	        res.setEncoding('utf8')
		var json_str = ""
		res.on('data', function (chunk) {
			json_str += chunk
			})
		res.on('end', function ()
			{
			var unit_aa = JSON.parse (json_str)

			unit_aa.population = population_in
			unit_aa.date_mod = text_manipulate.get_current_date_proc ()
			var string_out = JSON.stringify (unit_aa)
			console.log (string_out)

			http_manipulate.put_proc (host_server,8098,path_target,string_out)

			console.log ("*** 終了 ***")
			})
	}).on('error', function(ee)
		{
		console.log("Got error: " + ee.message)
		})
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var key_in=process.argv[2]
var population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

riak_update_proc (key_in,population_in)

// ---------------------------------------------------------------
