#! /usr/bin/coffee
# ---------------------------------------------------------------
#	riak_update.coffee
#
#					Feb/09/2015
# ---------------------------------------------------------------
http = require('http')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
riak_update_proc = (key_in,population_in) ->
	path_target = '/riak/shimane/' + key_in

	options = {
		host: 'host_ubuntu1',
		port: 8098,
		path: path_target
	}

	req = http.get options, (res) ->
#		console.log("Got response: " + res.statusCode)
# console.log('HEADERS: ' + JSON.stringify(res.headers))
	        res.setEncoding('utf8')
		json_str = ""
		res.on 'data', (chunk) ->
			json_str += chunk
		res.on 'end', () ->
			unit_aa = JSON.parse(json_str)
			unit_aa.population = population_in
			unit_aa.date_mod = text_manipulate.get_current_date_proc()
			string_out = JSON.stringify(unit_aa)
			console.log (string_out)

			http_manipulate.put_proc('localhost',8098,path_target,string_out)

			console.log ("*** 終了 ***")
	req.on 'error', (ee) ->
		console.log("Got error: " + ee.message)

# ---------------------------------------------------------------
console.log "*** 開始 ***"

key_in=process.argv[2]
population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

riak_update_proc(key_in,population_in)

# ---------------------------------------------------------------
