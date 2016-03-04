// ---------------------------------------------------------------
//	riak_read.ts
//
//					Feb/25/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

// ---------------------------------------------------------------
function record_fetch_proc_s4 (options_in,key_in)
{
	http.get(options_in, function(res)
		{
// console.log("Got response: " + res.statusCode)
// console.log('HEADERS: ' + JSON.stringify(res.headers))
	        res.setEncoding('utf8')
		var json_str = ""
		res.on('data', function (chunk) {
			json_str += chunk
			})
		res.on('end', function ()
			{
			var unit_aa = JSON.parse (json_str)

			var str_out: string = key_in + '\t'
			str_out += unit_aa['name'] + '\t'
			str_out += unit_aa['population'] + '\t'
			str_out += unit_aa['date_mod']

			console.log (str_out)

		})

}).on('error', function(e)
	{
	console.log("Got error: " + e.message)
	})
}

// ---------------------------------------------------------------
function record_fetch_proc (options,keys_in)
{
	for (var it in keys_in)
		{
		var key: string = keys_in[it]
//		console.log (key)

		options['path'] = '/riak/shimane/' + key

		record_fetch_proc_s4 (options,key)
		}
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var http = require('http')

var options = {
	host: 'host_ubuntu',
	port: 8098,
	path: '/riak/shimane?keys=true',
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
		var data_aa = JSON.parse (json_str)

		record_fetch_proc (options,data_aa.keys)

		console.log ("*** 終了 ***")
		})

}).on('error', function(e)
	{
	console.log("Got error: " + e.message)
	})

// ---------------------------------------------------------------

