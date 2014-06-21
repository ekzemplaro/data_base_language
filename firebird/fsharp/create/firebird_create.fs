// ----------------------------------------------------------------
//
//	firebird_create.fs
//
//					Nov/11/2011
//
//
// ----------------------------------------------------------------
open System
open System.Text
open System.Collections.Generic

open FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3821","松山",62384,"1997-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3822","今治",87951,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3823","宇和島",84926,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3824","八幡浜",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3825","新居浜",51978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3826","西条",75647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3827","大洲",46786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3828","伊予",24835,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3829","西予",71324,"1997-10-12")

  dict_aa
// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  printfn "*** 開始 ***"


  let user = "sysdba"
  let passwd = "tiger"
  let dbname = "/var/tmp/firebird/cities.fdb"

  let ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

  let conn = new FbConnection(ConnectionString)
  conn.Open()

  let dict_aa = data_prepare_proc ()


  fbd_manipulate.table_drop_proc (conn)

  fbd_manipulate.table_create_proc (conn)

  fbd_manipulate.table_insert_proc (conn,dict_aa)

  fbd_manipulate.firebird_display_proc (conn)

  conn.Close() 

  printfn "*** 終了 ***"

  0
// ----------------------------------------------------------------
