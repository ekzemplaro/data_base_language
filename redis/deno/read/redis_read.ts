// ---------------------------------------------------------------
//	redis_read.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { connect } from "https://denopkg.com/keroxp/deno-redis/mod.ts"
// ---------------------------------------------------------------
function display_line_proc (key:string,json_str:string)
{
	const data = JSON.parse (json_str)

	var out_str: string = key + "\t"
	out_str  += data.name + "\t"
	out_str += data.population + "\t"
	out_str += data.date_mod
	console.log (out_str)
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const client = await connect({ hostname: "127.0.0.1", port: 6379 })

const keys:string[]=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]

for (var it in keys)
	{
	const key:string = keys[it]
	const reply = await client.get(key)
	if (reply != null)
		{
		display_line_proc (key,reply)
		}
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
