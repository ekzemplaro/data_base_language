// ---------------------------------------------------------------
//	postgre_read.ts
//
//					May/19/2020
//
// ---------------------------------------------------------------
import { Client } from "https://deno.land/x/postgres/mod.ts"
// ---------------------------------------------------------------
console.error ("*** 開始 ***");

const client = new Client({
    user: "scott",
    database: "city",
    hostname: "localhost",
    port: 5432
  });
  await client.connect();
  const result = await client.query("SELECT * FROM cities order by id;");
//  console.log(result.rows);
for (var it in result.rows)
	{
	const row = result.rows[it]

	var str_out:string = row[0] + '\t'
	str_out += row[1] + '\t'
	str_out += row[2] + '\t'
	str_out += row[3]
	console.log (str_out)
	}
  await client.end();

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
