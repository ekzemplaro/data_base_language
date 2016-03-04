// -------------------------------------------------------------
//	mcached_read.ts
//
//					Feb/11/2016
// -------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var memcache = require('memcache')
var underscore = require('underscore')

var node_common = '/var/www/data_base/common/node_common'
var json_manipulate=require (node_common + '/json_manipulate')
// -------------------------------------------------------------
function proc01 (key)
{
	client.get(key, function(error,reply)
		{
		if (!error)
			{
			if (reply != null)
				{
				json_manipulate.json_display_proc (key,reply)
				}
			}
		})
}

// -------------------------------------------------------------
var onConnect = function()
{
	console.log("*** 開始 ***")
	var keys: string[] = ['t1731','t1732','t1733',
		't1734','t1735','t1736',
		't1737','t1738','t1739']

	for (var it in keys)
		{
		proc01 (keys[it])
		}

	client.close()
	console.log("*** 終了 ***")
}


// -------------------------------------------------------------
var client = new memcache.Client (11211,'localhost')
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

