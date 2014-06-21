// -------------------------------------------------------------------
//
//	oracle_create.fs
//
//					May/23/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open System.Data.OracleClient

// -------------------------------------------------------------------
let table_drop_proc (conn: OracleConnection) =
  printfn "*** table_drop_proc ***"
  let sql_str = "drop table cities"
  printfn "%s" sql_str
  let cmd = new OracleCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  printfn "rowsAffected = %d" rowsAffected
  printfn "*** table_drop_proc *** finish";;

// -------------------------------------------------------------------
let table_create_proc (conn: OracleConnection) =
  printfn "*** table_create_proc ***"
  let sql_str = "create TABLE cities (" + "id varchar(10) NOT NULL PRIMARY KEY," + "name varchar(20)," + "population int," + "date_mod date)"
  printfn "%s" sql_str
  let cmd = new OracleCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_row_proc (conn: OracleConnection,id_a,name,population_a,str_date) =
  let fmt_aa = "insert into cities (id, Name, Population, date_mod) values ('"
  let fmt_bb = id_a + "','" + name + "'," + population_a.ToString ()
  let fmt_cc = ",'" + str_date + "')"
  let sql_str = fmt_aa + fmt_bb + fmt_cc
  let cmd = new OracleCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_insert_proc (conn: OracleConnection) =
  printfn "*** data_insert_proc *** start ***"

  data_row_proc (conn,"t0131","函館",15837,"1997-6-21")
  data_row_proc (conn,"t0132","札幌",27968,"1997-5-19")
  data_row_proc (conn,"t0133","帯広",44624,"1997-2-7")
  data_row_proc (conn,"t0134","釧路",79186,"1997-7-19")
  data_row_proc (conn,"t0135","旭川",64512,"1997-11-2")
  data_row_proc (conn,"t0136","北見",25275,"1997-10-7")
  data_row_proc (conn,"t0137","室蘭",19293,"1997-9-9")
  data_row_proc (conn,"t0138","根室",42857,"1997-5-22")
  data_row_proc (conn,"t0139","稚内",41321,"1997-7-18")

  ();;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let str_connect = "User Id=scott;Password=tiger;Data Source=spn109:1521/xe"

  let conn = new OracleConnection (str_connect)

  conn.Open ()

  table_drop_proc (conn)

  table_create_proc (conn)

  data_insert_proc (conn)

  conn.Close ()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
