#! /usr/bin/coffee
# ---------------------------------------------------------------
#	riak_read.coffee
#
#					Dec/24/2013
#
# ---------------------------------------------------------------
http = require('http')
# ---------------------------------------------------------------
record_fetch_proc_s4 = (options_in,key_in) ->
	http.get options_in, (res) ->
# console.log("Got response: " + res.statusCode)
# console.log('HEADERS: ' + JSON.stringify(res.headers))
	        res.setEncoding('utf8')
		json_str = ""
		res.on 'data', (chunk) ->
			json_str += chunk
		res.on 'end', () ->
			unit_aa = JSON.parse (json_str)

			str_out = key_in + '\t'
			str_out += unit_aa['name'] + '\t'
			str_out += unit_aa['population'] + '\t'
			str_out += unit_aa['date_mod']

			console.log str_out

#}).on('error', function(e)
#	{
#	console.log("Got error: " + e.message)
#	})

# ---------------------------------------------------------------
record_fetch_proc = (options,keys_in) ->
	for it of keys_in
		key = keys_in[it]
		console.log (key)

		options['path'] = '/riak/shimane/' + key

		record_fetch_proc_s4(options,key)

# ---------------------------------------------------------------
console.log "*** 開始 ***"


options = {
	host: 'localhost',
	port: 8098,
	path: "/riak/shimane?keys=true"}

req = http.get options, (res) ->
#	console.log("Got response: " + res.statusCode)
# console.log('HEADERS: ' + JSON.stringify(res.headers))
        res.setEncoding('utf8')
	json_str = ""
	res.on 'data', (chunk) ->
		json_str += chunk
	res.on 'end', () ->
		data_aa = JSON.parse(json_str)

		record_fetch_proc(options,data_aa.keys)

		console.log ("*** 終了 ***")

#}).on('error', function(e)
#	{
#	console.log("Got error: " + e.message)
#	})

# ---------------------------------------------------------------

