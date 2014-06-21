// ----------------------------------------------------------------
//
//	firebird_update.fs
//
//					Oct/25/2011
//
//
// ----------------------------------------------------------------
open System

open FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let id_in = args.[0]
  let population_in = int args.[1]

  printfn "%s" id_in
  printfn "%d" population_in

  let user = "sysdba"
  let passwd = "tiger"
  let dbname = "/var/tmp/firebird/cities.fdb"

  let ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

  let conn = new FbConnection(ConnectionString)
  conn.Open()


  fbd_manipulate.update_proc (conn,id_in,population_in);

  conn.Close() 

  printfn "*** 終了 ***"

  0

// ----------------------------------------------------------------
