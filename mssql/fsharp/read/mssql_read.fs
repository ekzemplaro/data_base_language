// -------------------------------------------------------------------
//
//	mssql_read.fs
//
//					Feb/08/2016
//
// -------------------------------------------------------------------
#light "on"
open System
open System.Data
open System.Data.SqlClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let str_connect = "server=host_mssql\EG;uid=sa;pwd=Tiger123;database=city;"

  let conn = new SqlConnection (str_connect)
  conn.Open()

  let cmd = new SqlCommand ("SELECT * FROM cities", conn)
  let reader = cmd.ExecuteReader ()

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
