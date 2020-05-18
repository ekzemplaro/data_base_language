// ---------------------------------------------------------------
//	maria_read.ts
//
//					May/18/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/mysql/mod.ts"
import { dict_display_proc } from "./text_manipulate.ts"

// ---------------------------------------------------------------
function data_process(data:any):{[key: string]: any}
{
	var dict_aa : {[key: string]: any} = new Object()

	for (var it in data)
		{
		const unit = data[it]

		dict_aa[unit.id] = {"name": unit.name,
				"population": unit.population,
				"date_mod": unit.date_mod}
		}

	return dict_aa
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const client = await new Client().connect({
  hostname: "127.0.0.1",
  username: "scott",
  password: "tiger123",
  db: "city",
})

const data = await client.query(`select * from cities`)

await client.close()

const dict_aa = data_process(data)

dict_display_proc (dict_aa)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
