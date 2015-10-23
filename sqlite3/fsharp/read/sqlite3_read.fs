// -------------------------------------------------------------------
//
//	sqlite3_read.fs
//
//					Jul/13/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Mono.Data.Sqlite

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let file_sqlite3 = "/var/tmp/sqlite3/cities.db"

  let string_connect = "Data Source = " + file_sqlite3 + ";UTF8Encoding=True;Version=3"
  let conn = new SqliteConnection (string_connect)
  conn.Open()

  let cmd = new SqliteCommand( "SELECT * FROM cities", conn )
  let reader = cmd.ExecuteReader()

  while reader.Read()
    do System.Console.Write (reader.GetString 0 )
       System.Console.Write ("\t")
       System.Console.Write (reader.GetString 1 )
       System.Console.Write ("\t")
       System.Console.Write (reader.GetInt32 2 )
       System.Console.Write ("\t")
       System.Console.WriteLine (reader.GetString 3 )
       done

  reader.Close()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
