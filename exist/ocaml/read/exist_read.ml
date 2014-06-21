(* ------------------------------------------------------------------- *)
(*
	exist_read.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Xml
open	Xml_manipulate
open	Curl_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://localhost:8086/exist/rest/db/cities/cities.xml"

let _ = curl_get_proc url_target show_xml_str_proc

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
