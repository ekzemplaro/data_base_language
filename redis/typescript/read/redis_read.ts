// ---------------------------------------------------------------
//	redis_read.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var redis = require ("redis")

console.log ("*** 開始 ***")

var client = redis.createClient(6379,'host_dbase')

client.on ("error", function (err)
{
        console.log ("Redis connection error to "
		+ client.host + ":" + client.port + " - " + err)
})

var keys=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]
for (var it in keys)
	{
	read_single_proc (client,keys[it])
	}

client.quit()
console.log ("*** 終了 ***")

// ---------------------------------------------------------------
function read_single_proc (client,key)
{
	client.get (key, function (err, reply)
	{
	if (err)
		{
		console.log("Get error: " + err)
        	}
	 else if (reply != null)
		{
		var json_str = reply
		var data = JSON.parse (json_str)

		var out_str: string = key + "\t"
		out_str  += data.name + "\t"
		out_str += data.population + "\t"
		out_str += data.date_mod
		console.log (out_str)
		}
	})
}

// ---------------------------------------------------------------
