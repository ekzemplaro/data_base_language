// ---------------------------------------------------------------
//	maria_delete.ts
//
//					May/18/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/mysql/mod.ts"
import { delete_command_gen } from "./sql_manipulate.ts"

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var id_in:string = Deno.args[0]

console.log (id_in)

const client = await new Client().connect({
  hostname: "127.0.0.1",
  username: "scott",
  password: "tiger123",
  db: "city",
})


const command: string = delete_command_gen (id_in)

const result = await client.query(command)

console.log ("*** 終了 ***")


// ---------------------------------------------------------------
