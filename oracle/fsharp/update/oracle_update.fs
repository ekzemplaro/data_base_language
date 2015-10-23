// -------------------------------------------------------------------
//
//	Oracle_update.fs
//
//					May/23/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open System.Data.OracleClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let id_in = args.[0]
  let population_in = args.[1]

  let str_connect = "User Id=scott;Password=tiger;Data Source=spn109:1521/xe"

  let conn = new OracleConnection (str_connect)
  conn.Open()

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)
  let ft_aa = "update cities set POPULATION = " + population_in + ", "
  let ft_bb = " DATE_MOD='" + today + "'"
  let ft_cc = " where ID = '" + id_in + "'"
  let sql_str = ft_aa + ft_bb + ft_cc
  printfn "%s" sql_str
  let cmd = new OracleCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
