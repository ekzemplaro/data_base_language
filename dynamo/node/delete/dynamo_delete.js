#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_delete.js
//
//					Dec/19/2017
//
// ---------------------------------------------------------------
function delete_proc (docClient,key_in)
{
	const tbl_name = "cities"

	var params = {
		TableName: tbl_name,
		Key: {"key": {"S": key_in} }
			}

	docClient.delete(params, function(err, data)
		{
		if (err) {
			console.error("Unable to get cities",JSON.stringify(err, null, 2))
		
			console.error("key = " + key)
			}
		 else {
			}
		})

}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const key_in=process.argv[2]

console.error ("key_in = " + key_in)

var AWS = require("aws-sdk")

AWS.config.update({
	region: "ap-northeast-1",
	endpoint: "http://localhost:8000"
})

var docClient = new AWS.DynamoDB.DocumentClient();

delete_proc (docClient,key_in)

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
