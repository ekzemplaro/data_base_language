#! /usr/bin/node
// ---------------------------------------------------------------
//	delete/elastic_delete.js
//
//					Oct/06/2018
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const key_in=process.argv[2]

console.log (key_in)

const url = "http://localhost:9200/cities/tochigi/" + key_in

var Client = require('node-rest-client').Client
var client = new Client()
client.delete(url,function (data, response) {
	console.error ("*** 終了 ***")
	})


// ---------------------------------------------------------------
