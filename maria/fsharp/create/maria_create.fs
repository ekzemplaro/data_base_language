// -------------------------------------------------------------------
//
//	maria_create.fs
//
//					Feb/08/2016
//
// -------------------------------------------------------------------
open System
open System.Data
open MySql.Data.MySqlClient

// -------------------------------------------------------------------
let table_drop_proc (conn: MySqlConnection) =
  printfn "*** table_drop_proc ***"
  let sql_str = "drop table cities"
  printfn "%s" sql_str
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  printfn "rowsAffected = %d" rowsAffected;;

// -------------------------------------------------------------------
let table_create_proc (conn: MySqlConnection) =
  printfn "*** table_create_proc ***"
  let sql_str = "create TABLE cities (" + "id varchar(10) NOT NULL PRIMARY KEY," + "name text," + "population int," + "date_mod text)"
  printfn "%s" sql_str
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_row_proc (conn: MySqlConnection,id_a,name,population_a,str_date) =
  let fmt_aa = "insert into cities (id, Name, Population, date_mod) values ('"
  let fmt_bb = id_a + "','" + name + "'," + population_a.ToString ()
  let fmt_cc = ",'" + str_date + "')"
  let sql_str = fmt_aa + fmt_bb + fmt_cc
  let cmd = new MySqlCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_insert_proc (conn: MySqlConnection) =
  printfn "*** data_insert_proc *** start ***"

  data_row_proc (conn,"t3321","岡山",432815,"1997-5-15")
  data_row_proc (conn,"t3322","倉敷",591274,"1997-4-12")
  data_row_proc (conn,"t3323","津山",854632,"1997-9-7")
  data_row_proc (conn,"t3324","玉野",729153,"1997-2-19")
  data_row_proc (conn,"t3325","笠岡",614529,"1997-11-2")
  data_row_proc (conn,"t3326","井原",235784,"1997-10-7")
  data_row_proc (conn,"t3327","総社",169237,"1997-6-9")
  data_row_proc (conn,"t3328","高梁",142386,"1997-1-16")
  data_row_proc (conn,"t3329","新見",431765,"1997-3-21")

  ();;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"

  let conn = new MySqlConnection "userid=scott;password=tiger;database=city;Host=localhost"

  conn.Open ()

  table_drop_proc (conn)

  table_create_proc (conn)

  data_insert_proc (conn)

  conn.Close ()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
