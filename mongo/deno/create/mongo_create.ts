//
//	mongo_create.ts
//
//					May/28/2020
//
// ----------------------------------------------------------------
function dict_append_proc(dict_aa: {[key: string]: any},id_in:string,
	name_in:string,population_in:number,date_mod_in:string)
{
	var unit_aa:{[key: string]: any} = new Object()

	unit_aa['name'] = name_in
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod_in

	dict_aa[id_in] = unit_aa

	return	dict_aa
}

// ----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa : {[key: string]: any} = new Object ()

	dict_aa = dict_append_proc (dict_aa,'t1161','さいたま',38729,'2014-9-14')
	dict_aa = dict_append_proc (dict_aa,'t1162','所沢',23157,'2014-5-26')
	dict_aa = dict_append_proc (dict_aa,'t1163','越谷',91426,'2014-8-12')
	dict_aa = dict_append_proc (dict_aa,'t1164','久喜',37864,'2014-9-18')
	dict_aa = dict_append_proc (dict_aa,'t1165','熊谷',67358,'2014-7-14')
	dict_aa = dict_append_proc (dict_aa,'t1166','秩父',51792,'2014-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1167','川越',38251,'2014-5-15')
	dict_aa = dict_append_proc (dict_aa,'t1168','和光',54386,'2014-4-20')
	dict_aa = dict_append_proc (dict_aa,'t1169','新座',27891,'2014-9-24')
	
	return	dict_aa
}

// ----------------------------------------------------------------
import { MongoClient } from "https://deno.land/x/mongo@v0.7.0/mod.ts";
import { config } from "https://deno.land/x/dotenv/mod.ts"

console.log ("*** 開始 ***")
const config_env:any = config()

const user:string = config_env.user
const password:string = config_env.password
const db_name:string = config_env.db
const collection_name:string = config_env.collection

const host = user + ':' + password + '@localhost'
const port = 27017

const dict_aa = data_prepare_proc ()

const url = 'mongodb://' + host + ':' + port
console.log("Connecting to " + host + ":" + port)

const client = new MongoClient()
client.connectWithUri(url)
const db = client.database(db_name)
const cities = db.collection(collection_name)

const deleteCount2 = await cities.deleteMany({ key:  { $ne: null } })
console.log(deleteCount2," deleted.")

for (var id in dict_aa)
	{
	const unit_aa:{[key: string]: any} = dict_aa[id] 
	const insertId = await cities.insertOne({
		key: id,
		name: unit_aa.name,
		population: unit_aa.population,
		date_mod: unit_aa.date_mod,
		})
	}

console.log ("*** 終了 ***")

// ----------------------------------------------------------------
