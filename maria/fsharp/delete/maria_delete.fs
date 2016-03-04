// -------------------------------------------------------------------
//
//	maria_delete.fs
//
//					Feb/08/2016
//
// -------------------------------------------------------------------
open System
open System.Data
open MySql.Data.MySqlClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let id_in = args.[0]

  let conn = new MySqlConnection "userid=scott;password=tiger;database=city;Host=localhost"
  conn.Open()

  let sql_str = "delete from cities where ID = '" + id_in + "'"
  printfn "%s" sql_str
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  conn.Close()
  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
