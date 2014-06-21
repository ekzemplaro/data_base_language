(* ------------------------------------------------------------------- *)
(*
	ftp_read.ml

					Jun/19/2012

*)
(* ------------------------------------------------------------------- *)
open	Json_manipulate
open	Curl_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "ftp://scott:tiger@host_dbase/city/iwate.json"

let _ = curl_get_proc url_target show_json_str_proc

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
