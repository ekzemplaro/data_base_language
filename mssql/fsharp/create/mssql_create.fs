// -------------------------------------------------------------------
//
//	mssql_create.fs
//
//					Dec/16/2013
//
// -------------------------------------------------------------------
open System
open System.Data
open System.Data.SqlClient

// -------------------------------------------------------------------
let table_drop_proc (conn: SqlConnection) =
  printfn "*** table_drop_proc ***"
  let sql_str = "drop table cities"
  printfn "%s" sql_str
  let cmd = new SqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  printfn "rowsAffected = %d" rowsAffected;;

// -------------------------------------------------------------------
let table_create_proc (conn: SqlConnection) =
  printfn "*** table_create_proc ***"
  let sql_str = "create TABLE cities (" + "id varchar(10) NOT NULL PRIMARY KEY," + "name nvarchar(20)," + "population int," + "date_mod datetime)"
  printfn "%s" sql_str
  let cmd = new SqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_row_proc (conn: SqlConnection,id_a,name,population_a,str_date) =
  let fmt_aa = "insert into cities (id, Name, Population, date_mod) values ('"
  let fmt_bb = id_a + "','" + name + "'," + population_a.ToString ()
  let fmt_cc = ",'" + str_date + "')"
  let sql_str = fmt_aa + fmt_bb + fmt_cc
  let cmd = new SqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_insert_proc (conn: SqlConnection) =
  printfn "*** data_insert_proc *** start ***"

  data_row_proc (conn,"t1071","前橋",95147,"1997-9-24")
  data_row_proc (conn,"t1072","高崎",27961,"1997-8-12")
  data_row_proc (conn,"t1073","桐生",42654,"1997-10-7")
  data_row_proc (conn,"t1074","沼田",39176,"1997-7-19")
  data_row_proc (conn,"t1075","伊勢崎",64592,"1997-11-2")
  data_row_proc (conn,"t1076","水上",75218,"1997-10-7")
  data_row_proc (conn,"t1077","太田",19283,"1997-9-17")
  data_row_proc (conn,"t1078","安中",42867,"1997-5-21")
  data_row_proc (conn,"t1079","みどり",48361,"1997-7-18")

  ();;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let str_connect = "server=host_mssql;uid=sa;pwd=scott_tiger;database=city;"

  let conn = new SqlConnection (str_connect)

  conn.Open ()

  table_drop_proc (conn)

  table_create_proc (conn)

  data_insert_proc (conn)

  conn.Close ()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
