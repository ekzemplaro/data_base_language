#! /usr/local/bin/node
// ---------------------------------------------------------------
//	http_manipulate.js
//
//					Dec/23/2011
// ---------------------------------------------------------------
var text_manipulate = require('./text_manipulate');
// ---------------------------------------------------------------
exports.put_proc = function (host_in,port_in,path_in,string_out)
{
	var options = {
	host: host_in,
	port: port_in,
	path: path_in,
	method: 'PUT',
	headers: {'content-type':'application/json'}
};

	var http = require('http');

var req = http.request(options, function(res) {
  console.log('STATUS: ' + res.statusCode);
//  console.log('HEADERS: ' + JSON.stringify(res.headers));
  res.setEncoding('utf8');
  res.on('data', function (chunk) {
    console.log('BODY: ' + chunk);
  });
});

req.on('error', function(e) {
  console.log('problem with request: ' + e.message);
});

// write data to request body
req.write(string_out);
req.end();


}

// ---------------------------------------------------------------
exports.delete_proc = function (host_in,port_in,path_in)
{
	var options = {
		host: host_in,
		port: port_in,
		path: path_in,
		method: 'DELETE',
		headers: {'content-type':'application/json'}
	};

	var http = require('http');

	var req = http.request(options, function(res) {
		console.log('STATUS: ' + res.statusCode);
//  console.log('HEADERS: ' + JSON.stringify(res.headers));
		res.setEncoding('utf8');
		res.on('data', function (chunk) {
			console.log('BODY: ' + chunk);
			});
	});

	req.on('error', function(e) {
		console.log('problem with request: ' + e.message);
	});

	req.end();

}
// ---------------------------------------------------------------
