// -------------------------------------------------------------------
//
//	postgre_update.fs
//
//					Dec/21/2010
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
  let population_in = args.[1]

  let str_connect = "Server=localhost;Port=5432;User Id=scott;Password=tiger;ENCODING=UNICODE;Database=city;"


  let conn = new NpgsqlConnection (str_connect)

  conn.Open()

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)
  let ft_aa = "update cities set POPULATION = " + population_in + ", "
  let ft_bb = " DATE_MOD='" + today + "'"
  let ft_cc = " where ID = '" + id_in + "'"
  let sql_str = ft_aa + ft_bb + ft_cc
  printfn "%s" sql_str
  let cmd = new NpgsqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
