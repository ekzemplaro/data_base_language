// -------------------------------------------------------------
//	tyrant_read.ts
//
//					Feb/15/2016
// -------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var memcache = require('memcache')

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
	var keys: string[] = ['t4761','t4762','t4763',
		't4764','t4765','t4766',
		't4767','t4768','t4769']

	for (var it in keys)
		{
		proc01 (keys[it])
		}

	client.close()
	console.log("*** 終了 ***")
}


// -------------------------------------------------------------
var client = new memcache.Client (1978,'host_ubuntu')
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

