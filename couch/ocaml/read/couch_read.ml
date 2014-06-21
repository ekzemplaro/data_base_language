(* ------------------------------------------------------------------- *)
(*
	couch_read.ml

					Jul/25/2012

*)
(* ------------------------------------------------------------------- *)
open	Json_manipulate
open	Curl_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://cddn007:5984/city/cities"

let _ = curl_get_proc url_target show_json_str_proc
(*
let str_json = curl_get_proc url_target
*)

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
