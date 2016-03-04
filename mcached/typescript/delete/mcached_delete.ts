// -------------------------------------------------------------
//	mcached_delete.ts
//
//					Feb/11/2016
// -------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var memcache = require('memcache')

// -------------------------------------------------------------
var onConnect = function()
{
	console.log("*** 開始 ***")

	client.delete (key_in,function(error, result){ })

	client.close()

	console.log("*** 終了 ***")
}


// -------------------------------------------------------------
var key_in: string=process.argv[2]

console.log (key_in)

var client = new memcache.Client (11211,'localhost')
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

