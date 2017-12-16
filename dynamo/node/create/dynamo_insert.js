#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_insert.js
//
//					Dec/16/2017
//
// ---------------------------------------------------------------
function insert_proc (docClient,key,name,population,date_mod)
{
var params = {
        TableName: "cities",
        Item: {
            "key":  key,
            "name": name,
            "population":  population,
		"date_mod": date_mod
		}
}

docClient.put(params, function(err, data)
	{
	if (err) {
		console.error("Unable to add cities")
	} else {
		console.log("PutItem succeeded:")
		}
	})

}

// ---------------------------------------------------------------
var AWS = require("aws-sdk")

AWS.config.update({
  region: "ap-northeast-1"
})

const endpoint = new AWS.Endpoint('http://localhost:8000')
var docClient = new AWS.DynamoDB.DocumentClient({ endpoint: endpoint })

console.log("Importing into DynamoDB. Please wait.")

insert_proc (docClient,"t0921","宇都宮",37814,"2003-9-15")
insert_proc (docClient,"t0922","小山",28167,"2003-8-22")
insert_proc (docClient,"t0923","佐野",97125,"2003-7-9")
insert_proc (docClient,"t0924","足利",57819,"2003-6-11")

// ---------------------------------------------------------------
