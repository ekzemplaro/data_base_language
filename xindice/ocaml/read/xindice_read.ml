(* ------------------------------------------------------------------- *)
(*
	xindice_read.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Xml
open	Xml_manipulate
open	Curl_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://host_dbase:8888/xindice/db/cities/cities"

let _ = curl_get_proc url_target show_xml_str_proc

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
