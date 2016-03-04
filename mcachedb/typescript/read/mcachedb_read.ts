// -------------------------------------------------------------
//	mcachedb_read.ts
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
	var keys: string[] = ['t1521','t1522','t1523',
		't1524','t1525','t1526',
		't1527','t1528','t1529',
		't1530','t1531','t1532']

	for (var it in keys)
		{
		proc01 (keys[it])
		}

	client.close()
	console.log("*** 終了 ***")
}


// -------------------------------------------------------------
var hostname = 'host_ubuntu'

var client = new memcache.Client (21201,hostname)
client.connect()
client.addHandler(onConnect)

// -------------------------------------------------------------

