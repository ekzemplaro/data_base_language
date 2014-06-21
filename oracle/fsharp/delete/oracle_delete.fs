// -------------------------------------------------------------------
//
//	oracle_delete.fs
//
//					Dec/24/2010
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

  let str_connect = "User Id=scott;Password=tiger;Data Source=spn109:1521/xe"

  let conn = new OracleConnection (str_connect)
  conn.Open()

  let sql_str = "delete from cities where ID = '" + id_in + "'"
  printfn "%s" sql_str
  let cmd = new OracleCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
