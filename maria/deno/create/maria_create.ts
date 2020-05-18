// ---------------------------------------------------------------
//	maria_create.ts
//
//					May/18/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/mysql/mod.ts"
import { dict_append_proc } from "./text_manipulate.ts"

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
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',126957,'2014-11-2')
	

	return	dict_aa
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const dict_aa = data_prepare_proc ()

const client = await new Client().connect({
  hostname: "127.0.0.1",
  username: "scott",
  password: "tiger123",
  db: "city",
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
		var sql_str: string  = "insert into cities (id,name,population,date_mod) values ("

		var str_data: string = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

		sql_str += str_data
		result = await client.query(sql_str)
		console.log(result)
		}

await client.close()

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
