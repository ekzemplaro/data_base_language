// -------------------------------------------------------------------
//
//	sqlite3_create.fs
//
//					Jul/05/2011
//
// -------------------------------------------------------------------
open System
open System.Data
open Mono.Data.Sqlite

// -------------------------------------------------------------------
let table_drop_proc (conn: SqliteConnection) =
  printfn "*** table_drop_proc ***"
  let sql_str = "drop table cities"
  printfn "%s" sql_str
  let cmd = new SqliteCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  printfn "rowsAffected = %d" rowsAffected;;

// -------------------------------------------------------------------
let table_create_proc (conn: SqliteConnection) =
  printfn "*** table_create_proc ***"
  let sql_str = "create TABLE cities (" + "id varchar(10) NOT NULL PRIMARY KEY," + "name text," + "population int," + "date_mod text)"
  printfn "%s" sql_str
  let cmd = new SqliteCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_row_proc (conn: SqliteConnection,id_a,name,population_a,str_date) =
  let fmt_aa = "insert into cities (id, Name, Population, date_mod) values ('"
  let fmt_bb = id_a + "','" + name + "'," + population_a.ToString ()
  let fmt_cc = ",'" + str_date + "')"
  let sql_str = fmt_aa + fmt_bb + fmt_cc
  let cmd = new SqliteCommand (sql_str, conn )
  let rowsAffected = cmd.ExecuteNonQuery()
  ();;

// -------------------------------------------------------------------
let data_insert_proc (conn: SqliteConnection) =
  printfn "*** data_insert_proc *** start ***"

  data_row_proc (conn,"t0711","郡山",45276,"1997-9-24")
  data_row_proc (conn,"t0712","会津若松",37283,"1997-8-21")
  data_row_proc (conn,"t0713","白河",46217,"1997-2-7")
  data_row_proc (conn,"t0714","福島",91574,"1997-7-19")
  data_row_proc (conn,"t0715","喜多方",45652,"1997-11-2")
  data_row_proc (conn,"t0716","二本松",52981,"1997-10-7")
  data_row_proc (conn,"t0717","いわき",92367,"1997-9-9")
  data_row_proc (conn,"t0718","相馬",12479,"1997-6-12")
  data_row_proc (conn,"t0719","須賀川",41528,"1997-9-21")

  ();;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"
  let file_sqlite3 = args.[0]

  let str_connect = "Data Source = " + file_sqlite3 + ";UTF8Encoding=True;Version=3"

  let conn = new SqliteConnection (str_connect)

  conn.Open ()

  table_drop_proc (conn)

  table_create_proc (conn)

  data_insert_proc (conn)

  conn.Close ()

  printfn "*** 終了 ***"

  0

// -------------------------------------------------------------------
