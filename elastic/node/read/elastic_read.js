#! /usr/bin/node
// ---------------------------------------------------------------
//	read/elastic_read.js
//
//					Oct/06/2018
//
// ---------------------------------------------------------------
const text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const url = "http://localhost:9200/cities/tochigi/_search?q=*&size=100"

var Client = require('node-rest-client').Client
var client = new Client()
client.get(url,function (data, response) {
	try
		{
		var dict_aa = {}
		const array_aa = data.hits.hits
		console.log(array_aa.length)

		for (var it in array_aa)
			{
			const unit_aa = array_aa[it]
			const key = unit_aa._id
			dict_aa[key] = unit_aa._source
			}

		text_manipulate.dict_display_proc (dict_aa)
		console.error ("*** 終了 ***")
		}
	catch (error)
		{
		console.error ("*** error ***")
		console.error (error)
		}
})

// ---------------------------------------------------------------
