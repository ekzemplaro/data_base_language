// ----------------------------------------------------------------
//
//	firebird_delete.fs
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

  printfn "%s" id_in

  let user = "sysdba"
  let passwd = "tiger"
  let dbname = "/var/tmp/firebird/cities.fdb"

  let ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

  let conn = new FbConnection(ConnectionString)
  conn.Open()


  fbd_manipulate.delete_proc (conn,id_in)

  conn.Close() 

  printfn "*** 終了 ***"

  0

// ----------------------------------------------------------------
