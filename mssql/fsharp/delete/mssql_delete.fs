// -------------------------------------------------------------------
//
//	mssql_delete.fs
//
//					Feb/08/2016
//
// -------------------------------------------------------------------
open System
open System.Data
open System.Data.SqlClient

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn ("*** 開始 ***")
  let id_in = args.[0]

  let str_connect = "server=host_mssql\EG;uid=sa;pwd=Tiger123;database=city;"

  let conn = new SqlConnection (str_connect)
  conn.Open()

  let sql_str = "delete from cities where ID = '" + id_in + "'"
  printfn "%s" sql_str
  let cmd = new SqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()

  printfn "rowsAffected = %d" rowsAffected

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
