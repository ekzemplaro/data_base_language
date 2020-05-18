// ---------------------------------------------------------------
//	maria_update.ts
//
//					May/18/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/mysql/mod.ts"
import { update_command_gen } from "./sql_manipulate.ts"

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var id_in:string = Deno.args[0]
var population_in:number = parseInt(Deno.args[1])

console.log (id_in + "\t" + population_in)

const client = await new Client().connect({
  hostname: "127.0.0.1",
  username: "scott",
  password: "tiger123",
  db: "city",
})

const command: string = update_command_gen (id_in,population_in)

const result = await client.query(command)
console.log(result)

console.log ("*** 終了 ***")


// ---------------------------------------------------------------
