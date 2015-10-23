// --------------------------------------------------------------
//	read/neo4j_read.fs
//
//					Oct/21/2011
// --------------------------------------------------------------
open System

// --------------------------------------------------------------
let row_parser (key:String) =
  let uri= "http://localhost:7474/db/data/node/" + key + "/properties"
  let user = ""
  let passwd = ""
  let json_str = get_uri.get_uri_proc (uri,user,passwd)
  if (0 < String.length (json_str)) then
    neo4j_manipulate.out_record_proc (key,json_str)


// --------------------------------------------------------------
[<EntryPoint>]
let main (args : string[]) =

  printfn "*** 開始 ***"

  let keys =["2";"3";"4";"5";"6";"7";"8";"9";"10"]

  for key in keys do
    row_parser (key)

  printfn "*** 終了 ***"

  0

// --------------------------------------------------------------
