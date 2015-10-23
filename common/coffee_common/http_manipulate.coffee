# ---------------------------------------------------------------
#	http_manipulate.coffee
#
#					Dec/24/2013
# ---------------------------------------------------------------
http = require('http')
text_manipulate = require('./text_manipulate')
# ---------------------------------------------------------------
exports.put_proc = (host_in,port_in,path_in,string_out) ->
	options = {
		host: host_in,
		port: port_in,
		path: path_in,
		method: 'PUT',
		headers: {'content-type':'application/json'}
	}


	req = http.request options, (res) ->
		console.log('STATUS: ' + res.statusCode)
#		console.log('HEADERS: ' + JSON.stringify(res.headers))
		res.setEncoding('utf8')
		res.on 'data', (chunk) ->
			console.log('BODY: ' + chunk)

	req.on 'error', (e) ->
		console.log('problem with request: ' + e.message)

	req.write(string_out)
	req.end()

# ---------------------------------------------------------------
exports.delete_proc = (host_in,port_in,path_in) ->
	options = {
		host: host_in,
		port: port_in,
		path: path_in,
		method: 'DELETE',
		headers: {'content-type':'application/json'}
	}


	req = http.request options, (res) ->
		console.log('STATUS: ' + res.statusCode)
#  console.log('HEADERS: ' + JSON.stringify(res.headers))
		res.setEncoding('utf8')
		res.on 'data', (chunk) ->
			console.log('BODY: ' + chunk)

	req.on 'error', (e) ->
		console.log('problem with request: ' + e.message)

	req.end()

# ---------------------------------------------------------------
