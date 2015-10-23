// -------------------------------------------------------------------
//
//	sqlite3_update.fs
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
  let population_in = args.[2]

  let str_connect = "Data Source = " + file_sqlite3 + ";UTF8Encoding=True;Version=3"


  let conn = new SqliteConnection (str_connect)

  conn.Open()

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)
  let ft_aa = "update cities set POPULATION = " + population_in + ", "
  let ft_bb = " DATE_MOD='" + today + "'"
  let ft_cc = " where ID = '" + id_in + "'"
  let sql_str = ft_aa + ft_bb + ft_cc
  printfn "%s" sql_str
  let cmd = new SqliteCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
