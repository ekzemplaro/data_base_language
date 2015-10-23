(* ------------------------------------------------------------------- *)
(*
	xml_read.ml

					Feb/09/2012

open	Xml
*)
(* ------------------------------------------------------------------- *)
open	Unix

open	Text_manipulate
open	Xml_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let file_xml = Sys.argv.(1)

let str_xml = file_to_str_proc file_xml

let _ = show_xml_str_proc str_xml

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
