// ---------------------------------------------------------------
//	redis_delete.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { connect } from "https://denopkg.com/keroxp/deno-redis/mod.ts"
// ---------------------------------------------------------------

console.log ("*** 開始 ***")
const key_in:string=Deno.args[0]

console.log (key_in)

const client = await connect({ hostname: "127.0.0.1", port: 6379 })

client.del(key_in)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
