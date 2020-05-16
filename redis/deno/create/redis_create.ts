// ---------------------------------------------------------------
//	redis_create.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { connect } from "https://denopkg.com/keroxp/deno-redis/mod.ts"
import { dict_append_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object()

	dict_aa = dict_append_proc (dict_aa,'t1851','福井',32814,'2014-5-12')
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',68257,'2014-4-15')
	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',26841,'2014-12-2')
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',31864,'2014-3-22')
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',46358,'2014-2-14')
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',63792,'2014-7-12')
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',38251,'2014-3-21')
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',52486,'2014-7-26')
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',16859,'2014-11-8')
	
	return	dict_aa
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
const dict_aa = data_prepare_proc ()

const client = await connect({ hostname: "127.0.0.1", port: 6379 })


for (var key in dict_aa)
	{
	var str_json = JSON.stringify (dict_aa[key])

	const ok = await client.set(key, str_json)
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
