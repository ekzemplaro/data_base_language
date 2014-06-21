#! /usr/local/bin/node
// ---------------------------------------------------------------
//	cassandra_update.js
//
//					Jun/10/2011
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
var id_in=process.argv[2];
var population_in=process.argv[3];

console.log (id_in + "\t" + population_in);
//
var cql = require("cassandra-cql");
var conn = new cql.Connection({host: 'localhost', keyspace: 'Cities'});
//var conn = new cql.Connection({keyspace: 'Cities'});

var today = get_current_date_proc ()

console.log (today);

var sql_str  = "update cities set population='" + population_in + "',DATE_MOD='" + today +  "'  where KEY= '" + id_in + "'";

console.log (sql_str);

conn.execute('USE Cities', function(err) {
      if (err) {
        console.log(err);
//        test.fail();
      }

console.log ("*** check ssss ***");
conn.execute(sql_str, function(err, res) {
console.log ("*** check tttt ***");
    if (err) {
      // handle errors
      conn.close();
      return;
    }

res.forEach(function(row) {
      console.log(row);
	});

	conn.close();
});
});


console.log ("*** check pppp ***");


console.log ("*** 終了 ***");

// ---------------------------------------------------------------
function get_current_date_proc ()
{
	var today = new Date ();
	var ddx = (1900 + today.getYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx;
}
// ---------------------------------------------------------------
