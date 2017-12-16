#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_create.js
//
//					Dec/16/2017
//
// ---------------------------------------------------------------
var AWS = require("aws-sdk")

AWS.config.update({
  region: "ap-northeast-1"
})

const endpoint = new AWS.Endpoint('http://localhost:8000')
var dynamodb = new AWS.DynamoDB({ endpoint: endpoint })

var params = {
    TableName : "cities",
    KeySchema: [       
        { AttributeName: "key", KeyType: "HASH"},
    ],
    AttributeDefinitions: [       
        { AttributeName: "key", AttributeType: "S" }
    ],
    ProvisionedThroughput: {       
	ReadCapacityUnits: 5, 
	WriteCapacityUnits: 5
    }
}

dynamodb.createTable(params, function(err, data) {
    if (err) {
        console.error("Unable to create table. Error JSON:", JSON.stringify(err, null, 2))
    } else {
        console.log("Created table. Table description JSON:", JSON.stringify(data, null, 2))
    }
})

// ---------------------------------------------------------------
