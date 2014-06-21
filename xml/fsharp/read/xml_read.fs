// ----------------------------------------------------------------
//
//	xml_read.fs
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

  let xml_file = args.[0]
  printfn "*** 開始 ***"

  let str_xml = file_io.file_to_str_proc (xml_file)


  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
