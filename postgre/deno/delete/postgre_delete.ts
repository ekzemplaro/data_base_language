// ---------------------------------------------------------------
//	postgre_delete.ts
//
//					May/19/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/postgres/mod.ts"
import { delete_command_gen } from "./sql_manipulate.ts"

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
var id_in:string = Deno.args[0]

console.error (id_in)

const client = new Client({
    user: "scott",
    hostname: "localhost",
    database: "city",
    port: 5432
  })

await client.connect()

const command:string = delete_command_gen (id_in)

const result = await client.query(command)

await client.end()

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
