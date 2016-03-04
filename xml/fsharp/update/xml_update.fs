// ----------------------------------------------------------------
//
//	xml_update.fs
//
//					Feb/08/2016
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
  let id_in = args.[1]
  let population_in = int args.[2]
  printfn "%s\t%d" id_in population_in

  let str_xml = file_io.file_to_str_proc (xml_file)

  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  let dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  file_io.file_write_proc (xml_file,xml_str)

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
