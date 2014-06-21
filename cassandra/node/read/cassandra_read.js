#! /usr/local/bin/node
// ---------------------------------------------------------------
//	cassandra_read.js
//
//					Jun/10/2011
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//

var cql = require("cassandra-cql");
//var conn = new cql.Connection({host: 'localhost', keyspace: 'Cities'});
var conn = new cql.Connection({keyspace: 'Cities'});

conn.execute('SELECT KEY,name,population,date_mod FROM Akita', function(err, res) {
    if (err) {
      // handle errors
      conn.close();
      return;
    }

res.forEach(function(row) {
//      console.log(row);
	var out_str = ""
	row.columns.forEach(function(col) {
//	console.log(col.name, col.value);
	out_str += col.value + "\t";
//	console.log (col.value);
	});
	console.log (out_str);
	});

	conn.close();
});


console.log ("*** check pppp ***");


console.log ("*** 終了 ***");
// ---------------------------------------------------------------

