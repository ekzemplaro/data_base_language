// -------------------------------------------------------------
//	tyrant_delete.ts
//
//					Feb/15/2016
// -------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var memcache = require('memcache')

// -------------------------------------------------------------
var onConnect = function()
{
	client.delete (key_in,function(error, result){ })

	client.close()

	console.log("*** 終了 ***")
}


// -------------------------------------------------------------
var key_in: string =process.argv[2]

console.log("*** 開始 ***")

console.log (key_in)

var client = new memcache.Client (1978,'host_ubuntu')
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

