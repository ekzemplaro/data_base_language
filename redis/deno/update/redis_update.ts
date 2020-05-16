// ---------------------------------------------------------------
//	redis_update.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { connect } from "https://denopkg.com/keroxp/deno-redis/mod.ts"
import { get_current_date_proc } from "./text_manipulate.ts"

// ---------------------------------------------------------------
console.log ("*** 開始 ***")
var key_in:string=Deno.args[0]
var population_in:number = parseInt(Deno.args[1])

console.log (key_in + "\t" + population_in)

const client = await connect({ hostname: "127.0.0.1", port: 6379 })

const reply = await client.get(key_in)
if (reply != null)
	{
	const json_out:string = json_update_proc (reply,population_in)
	console.log(json_out)
	const ok = await client.set(key_in, json_out)
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
function json_update_proc (json_str:string,population_in:number)
{
	var unit_aa = JSON.parse (json_str)

	unit_aa.population = population_in
	unit_aa.date_mod =  get_current_date_proc ()
	var json_out = JSON.stringify (unit_aa)

	return	json_out
}

// ---------------------------------------------------------------
