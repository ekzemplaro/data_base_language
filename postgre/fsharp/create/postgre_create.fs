// -------------------------------------------------------------------
//
//	postgre_create.fs
//
//					Jul/16/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Npgsql

// -------------------------------------------------------------------
let table_drop_proc (conn: NpgsqlConnection) =
  printfn "*** table_drop_proc ***"
  let sql_str = "drop table cities"
  printfn "%s" sql_str
  let cmd = new NpgsqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  printfn "rowsAffected = %d" rowsAffected;;

// -------------------------------------------------------------------
let table_create_proc (conn: NpgsqlConnection) =
  printfn "*** table_create_proc ***"
  let sql_str = "create TABLE cities (" + "id varchar(10) NOT NULL PRIMARY KEY," + "name text," + "population int," + "date_mod text)"
  printfn "%s" sql_str
  let cmd = new NpgsqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_row_proc (conn: NpgsqlConnection,id_a,name,population_a,str_date) =
  let fmt_aa = "insert into cities (id, Name, Population, date_mod) values ('"
  let fmt_bb = id_a + "','" + name + "'," + population_a.ToString ()
  let fmt_cc = ",'" + str_date + "')"
  let sql_str = fmt_aa + fmt_bb + fmt_cc
  let cmd = new NpgsqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_insert_proc (conn: NpgsqlConnection) =
  printfn "*** data_insert_proc *** start ***"

  data_row_proc (conn,"t3461","広島",65215,"1997-7-21")
  data_row_proc (conn,"t3462","福山",76284,"1997-8-29")
  data_row_proc (conn,"t3463","東広島",14653,"1997-9-7")
  data_row_proc (conn,"t3464","呉",89176,"1997-2-19")
  data_row_proc (conn,"t3465","尾道",94521,"1997-11-2")
  data_row_proc (conn,"t3466","竹原",25248,"1997-10-7")
  data_row_proc (conn,"t3467","三次",19282,"1997-9-9")
  data_row_proc (conn,"t3468","大竹",12397,"1997-12-12")
  data_row_proc (conn,"t3469","府中",41725,"1997-5-23")

  ();;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let str_connect = "Server=localhost;Port=5432;User Id=scott;Password=tiger;ENCODING=UNICODE;Database=city;"

  let conn = new NpgsqlConnection (str_connect)

  conn.Open ()

  table_drop_proc (conn)

  table_create_proc (conn)

  data_insert_proc (conn)

  conn.Close ()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
