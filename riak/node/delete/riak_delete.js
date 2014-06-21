#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	riak_delete.js
//
//					Dec/23/2013
// ---------------------------------------------------------------
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------

// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var key_in=process.argv[2];

console.log (key_in);

var host_in = 'localhost';
var port_in = 8098;
var path_target = '/riak/shimane/'+ key_in;

http_manipulate.delete_proc (host_in,port_in,path_target);

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
