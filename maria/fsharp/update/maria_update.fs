// -------------------------------------------------------------------
//
//	maria_update.fs
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
  let key_in = args.[0]
  let population_in = int args.[1]
  printfn "%s\t%d" key_in population_in

  let conn = new MySqlConnection "userid=scott;password=tiger;database=city;Host=localhost"
  conn.Open()

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)
  let ft_aa = "update cities set POPULATION =  " +  string population_in + ", "
  let ft_bb = " DATE_MOD='" + today + "'"
  let ft_cc = " where ID = '" + key_in + "'"
  let sql_str = ft_aa + ft_bb + ft_cc
  printfn "%s" sql_str
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  conn.Close()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
