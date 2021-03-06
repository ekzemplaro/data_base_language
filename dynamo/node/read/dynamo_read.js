#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_read.js
//
//					Dec/19/2017
//
// ---------------------------------------------------------------
function scan_proc (docClient)
{
	const tbl_name = "cities"

	var params = {TableName: tbl_name}

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
	region: "ap-northeast-1",
	endpoint: 'http://localhost:8000'
})

var docClient = new AWS.DynamoDB.DocumentClient()

scan_proc (docClient)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
