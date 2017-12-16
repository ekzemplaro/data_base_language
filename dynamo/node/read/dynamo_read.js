#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_read.js
//
//					Dec/16/2017
//
// ---------------------------------------------------------------
function scan_proc (docClient)
{
	var params = {TableName: "cities"}

	docClient.scan(params, function(err, data)
		{
		if (err) {
			console.error("Unable to get cities",JSON.stringify(err, null, 2))
		
			console.error("key = " + key)
			}
		 else {
			var str_out = ""
			data.Items.forEach(function(city) {
			str_out += city.key + "\t"
				 + city.name + "\t"
				 + city.population + "\t"
				 + city.date_mod + "\n"
				})

			console.log(str_out)
			}
		})

}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var AWS = require("aws-sdk")

AWS.config.update({
  region: "ap-northeast-1"
})

// var docClient = new AWS.DynamoDB.DocumentClient()
const endpoint = new AWS.Endpoint('http://localhost:8000')
var docClient = new AWS.DynamoDB.DocumentClient({ endpoint: endpoint })

scan_proc (docClient)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
