#! /usr/local/bin/node
//
//	json_node_read.js
//
//					Dec/20/2010
//
// ---------------------------------------------------------------------
var fs = require("fs");

// ---------------------------------------------------------------------
console.log ("Content-type: text/json\n\n");

var filename="/var/tmp/json/cities.json";

fs.readFile(filename, function (err,json_str)
{
	if (err) {
		console.log("Error on read: " + err)
                }
	else {
//		console.log("File read.");
                }

console.log ("" + json_str);

});



// ---------------------------------------------------------------------
