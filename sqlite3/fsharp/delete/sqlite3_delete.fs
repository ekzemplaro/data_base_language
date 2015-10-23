// -------------------------------------------------------------------
//
//	sqlite3_delete.fs
//
//					Jul/05/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Mono.Data.Sqlite

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let file_sqlite3 = args.[0]
  let id_in = args.[1]

  let str_connect = "Data Source = " + file_sqlite3 + ";UTF8Encoding=True;Version=3"


  let conn = new SqliteConnection (str_connect)

  conn.Open()

  let sql_str = "delete from cities where ID = '" + id_in + "'"
  printfn "%s" sql_str
  let cmd = new SqliteCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
