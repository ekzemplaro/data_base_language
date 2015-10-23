// -------------------------------------------------------------------
//
//	postgre_read.fs
//
//					Jul/03/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Npgsql

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let str_connect = "Server=localhost;Port=5432;User Id=scott;Password=tiger;ENCODING=UNICODE;Database=city;"

  let conn = new NpgsqlConnection (str_connect)
  conn.Open()

  let cmd = new NpgsqlCommand( "SELECT * FROM cities", conn )
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
