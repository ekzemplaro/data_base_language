//
//	mongo_delete.ts
//
//					May/28/2020
// ----------------------------------------------------------------
import { MongoClient } from "https://deno.land/x/mongo@v0.7.0/mod.ts";
import { config } from "https://deno.land/x/dotenv/mod.ts"
// ----------------------------------------------------------------

console.log ("*** 開始 ***")

const key:string =Deno.args[0]

console.log (key)

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

const consolount = await cities.deleteOne({ key: key })

console.log ("*** 終了 ***")

// ----------------------------------------------------------------
