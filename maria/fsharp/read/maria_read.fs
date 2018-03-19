// -------------------------------------------------------------------
//
//	maria_read.fs
//
//					Mar/09/2018
//
// -------------------------------------------------------------------
open System
open System.Data
open MySql.Data.MySqlClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn ("*** 開始 ***")

  let conn = new MySqlConnection "userid=scott;password=tiger123;database=city;Host=localhost"
  conn.Open()

  let cmd = new MySqlCommand ("SELECT * FROM cities", conn )
  let reader = cmd.ExecuteReader()

  while reader.Read()
    do System.Console.Write (reader.GetString 0 )
       System.Console.Write ("\t")
       System.Console.Write (reader.GetString 1 )
       System.Console.Write ("\t")
       System.Console.Write (reader.GetInt32 2 )
       System.Console.Write ("\t")
       System.Console.WriteLine (reader.GetDateTime 3 )
       done

  reader.Close()
  conn.Close()

  printfn "*** 終了 ***"
  0

// -------------------------------------------------------------------
