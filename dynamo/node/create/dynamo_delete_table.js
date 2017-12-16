#! /usr/bin/node
// ---------------------------------------------------------------
//	dynamo_delete_table.js
//
//					Dec/16/2017
//
// ---------------------------------------------------------------
var AWS = require("aws-sdk");

AWS.config.update({
  region: "ap-northeast-1"
})

const endpoint = new AWS.Endpoint('http://localhost:8000')
var dynamodb = new AWS.DynamoDB({ endpoint: endpoint })

var params = {
    TableName : "cities"
    }

dynamodb.deleteTable(params, function(err, data) {
    if (err) {
        console.error("Unable to delete table. Error JSON:", JSON.stringify(err, null, 2));
    } else {
        console.log("Deleted table. Table description JSON:", JSON.stringify(data, null, 2));
    }
});

// ---------------------------------------------------------------
