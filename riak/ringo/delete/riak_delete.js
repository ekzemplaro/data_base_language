#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	riak_delete.js
//
//						Mar/15/2013
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var key_in = args[1];
print	(key_in);

var client= require ("ringo/httpclient");

var url_target='http://localhost:8098/riak/shimane/' + key_in;

var data=client.del (url_target);

print	("*** 終了 ***");
// ------------------------------------------------------------------
