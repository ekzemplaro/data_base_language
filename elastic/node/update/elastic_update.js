#! /usr/bin/node
// ---------------------------------------------------------------
//	elastic_update.js
//
//					Oct/06/2018
//
// ---------------------------------------------------------------
const text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const key_in=process.argv[2]
const population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

const url = "http://localhost:9200/cities/tochigi/" + key_in + "/_update"

const str_date_mod = text_manipulate.get_current_date_proc ()

const data = {"script" : {
	"source": "ctx._source.population = params.population; ctx._source.date_mod = params.date_mod",
        "lang": "painless",
        "params" : {
            "population" : population_in,
            "date_mod" : str_date_mod
	}
	}
	}

const headers = {'content-type': 'application/json'}

const args = { data: JSON.stringify(data), headers: headers }

var Client = require('node-rest-client').Client
var client = new Client()

client.post(url, args, function (data, response) {
	console.log(data)
	console.error ("*** 終了 ***")
})


// ---------------------------------------------------------------
