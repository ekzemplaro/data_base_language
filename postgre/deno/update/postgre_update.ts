// ---------------------------------------------------------------
//	postgre_update.ts
//
//					May/19/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/postgres/mod.ts"
import { update_command_gen } from "./sql_manipulate.ts"
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const id_in:string = Deno.args[0]
const population_in:number = parseInt(Deno.args[1])

console.log (id_in + "\t" + population_in)

const client = new Client({
    user: "scott",
    database: "city",
    hostname: "localhost",
    port: 5432
  });

  await client.connect()


const command:string = update_command_gen (id_in,population_in)

console.error (command)
const result = await client.query(command)

await client.end()

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
