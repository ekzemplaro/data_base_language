// ---------------------------------------------------------------
//	postgre_create.ts
//
//					May/03/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/postgres/mod.ts"
import { dict_append_proc } from "./text_manipulate.ts"
import { insert_command_gen } from "./sql_manipulate.ts"

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object()

	dict_aa = dict_append_proc (dict_aa,'t3461','広島',79325,'2014-4-12')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山',32197,'2014-7-17')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島',75241,'2014-8-21')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉',37164,'2014-9-22')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道',67358,'2014-5-14')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原',69281,'2014-9-12')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次',34256,'2014-3-21')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹',52371,'2014-7-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中',81736,'2014-10-2')
	

	return	dict_aa
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const dict_aa = data_prepare_proc ()

const client = new Client({
    user: "scott",
    hostname: "localhost",
    database: "city",
    port: 5432
  })

await client.connect()

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

	result = await client.query(sql_str)
//	console.log(result)
	}

await client.end()

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
