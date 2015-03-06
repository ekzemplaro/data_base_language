#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	riak_delete.js
//
//						Feb/24/2015
//
// ------------------------------------------------------------------
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
print	("*** 開始 ***");
var args = require('system').args;
var key_in = args[1];
print	(key_in);

var client= require ("ringo/httpclient");

var url_target='http://host_ubuntu1:8098/riak/shimane/' + key_in;

var data=client.del (url_target);

print	("*** 終了 ***");
// ------------------------------------------------------------------
