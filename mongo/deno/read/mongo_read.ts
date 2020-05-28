//
//	mongo_read.ts
//
//					May/28/2020
// ----------------------------------------------------------------
import { MongoClient } from "https://deno.land/x/mongo@v0.7.0/mod.ts";
import { config } from "https://deno.land/x/dotenv/mod.ts"

console.log ("*** 開始 ***")

const config_env:any = config()

const user:string = config_env.user
const password:string = config_env.password
const db_name:string = config_env.db
const collection_name:string = config_env.collection

const host:string = user + ':' + password + '@localhost'
const port:number = 27017

const url:string = 'mongodb://' + host + ':' + port

console.log("Connecting to " + host + ":" + port)

const client = new MongoClient()
client.connectWithUri(url)

const db = client.database(db_name)
const cities = db.collection(collection_name)

const all_cities = await cities.find({ key: { $ne: null } });

for (var it in all_cities)
	{
	const item = all_cities[it]
	var str_out = item.key + "\t" + item.name
	str_out += "\t" + item.population
	str_out += "\t" + item.date_mod
	console.log (str_out)
	}

console.log ("*** 終了 ***")

// ----------------------------------------------------------------
