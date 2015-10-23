// -------------------------------------------------------------------
//
//	oracle_read.fs
//
//					May/23/2011
//
// -------------------------------------------------------------------
#light "on"
open System
open System.Data
open System.Data.OracleClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

//  let str_connect = "server=cdbd025\SQLEXPRESS;uid=sa;pwd=hello9;database=city;"
  let str_connect = "User Id=scott;Password=tiger;Data Source=spn109:1521/xe"

  let conn = new OracleConnection (str_connect)
  conn.Open()

  let cmd = new OracleCommand( "SELECT * FROM cities", conn )
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

  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
