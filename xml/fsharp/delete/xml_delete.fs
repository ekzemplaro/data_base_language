// ----------------------------------------------------------------
//
//	xml_delete.fs
//
//					Sep/18/2011
//
//
// ----------------------------------------------------------------
open System
open System.Collections.Generic
// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let xml_file = args.[0]
  let key = args.[1]
  printfn "%s" key

  let str_xml = file_io.file_to_str_proc (xml_file)

  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  let _ = dict_aa.Remove (key)

  text_manipulate.dict_display_proc (dict_aa)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  file_io.file_write_proc (xml_file,xml_str)

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
