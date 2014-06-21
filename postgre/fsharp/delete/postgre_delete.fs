// -------------------------------------------------------------------
//
//	postgre_delete.fs
//
//					Jul/16/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Npgsql

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let id_in = args.[0]

  let str_connect = "Server=localhost;Port=5432;User Id=scott;Password=tiger;ENCODING=UNICODE;Database=city;"


  let conn = new NpgsqlConnection (str_connect)

  conn.Open()

  let sql_str = "delete from cities where ID = '" + id_in + "'"
  printfn "%s" sql_str
  let cmd = new NpgsqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
