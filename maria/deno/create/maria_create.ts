// ---------------------------------------------------------------
//	maria_create.ts
//
//					May/19/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/mysql/mod.ts"
import { config } from "https://deno.land/x/dotenv/mod.ts"

import { dict_append_proc } from "./text_manipulate.ts"
import { insert_command_gen } from "./sql_manipulate.ts"

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object()

	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',481763,'2014-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',163257,'2014-8-15')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',695241,'2014-10-2')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',231864,'2014-6-22')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',769358,'2014-8-14')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',865792,'2014-9-12')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',438251,'2014-3-21')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',352486,'2014-6-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',286957,'2014-11-2')
	

	return	dict_aa
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const config_env:any = config()

const dict_aa = data_prepare_proc ()

const client = await new Client().connect({
  hostname: "127.0.0.1",
  username: config_env.user,
  password: config_env.password,
  db: config_env.data_base,
})


var command:string = 'drop table if exists cities'
var result = await client.query(command)
console.log(result)

command = 'create table cities (id varchar(10), name varchar(20),'
command += ' population int, date_mod date)'
result = await client.query(command)
console.log(result)

	for (var key  in dict_aa)
		{
		const sql_str: string  = insert_command_gen(key,dict_aa[key])
		var result = await client.query(sql_str)
		console.log(result)
		}

await client.close()

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
