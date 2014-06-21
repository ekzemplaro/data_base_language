// -------------------------------------------------------------------
//
//	mysql_update.fs
//
//					Jul/11/2013
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
  let population_in = args.[1]

  let conn = new MySqlConnection "userid=scott;password=tiger;database=city;Host=host_mysql"
  conn.Open()

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)
  let ft_aa = "update cities set POPULATION = " + population_in + ", "
  let ft_bb = " DATE_MOD='" + today + "'"
  let ft_cc = " where ID = '" + id_in + "'"
  let sql_str = ft_aa + ft_bb + ft_cc
  printfn "%s" sql_str
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  conn.Close()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
