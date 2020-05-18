// ---------------------------------------------------------------
//	redis_read.ts
//
//					May/18/2020
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

const rvalue = await client.executor.exec("keys", "*")

const json_str = JSON.stringify(rvalue[1])
const keys:string[] = JSON.parse(json_str) 

for (var it in keys)
	{
	const key:string = keys[it].toString()
	const reply = await client.get(key)
	if (reply != null)
		{
		display_line_proc (key,reply)
		}
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
