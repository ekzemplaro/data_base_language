// -------------------------------------------------------------
//	mcachedb_delete.ts
//
//					Feb/15/2016
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
var key_in: string =process.argv[2]

console.log (key_in)

var hostname: string = 'host_ubuntu'
var client = new memcache.Client (21201,hostname)
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

