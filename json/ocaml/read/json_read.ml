(* ------------------------------------------------------------------- *)
(*
	json_read.ml

					Jul/25/2012
*)
(* ------------------------------------------------------------------- *)
open	Text_manipulate
open	Json_manipulate
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let json_file = Sys.argv.(1)
let json_str = file_to_str_proc json_file
let dict_aa = Hashtbl.create 100
let _ = json_to_dict_proc json_str dict_aa
let _ =	dict_display_proc dict_aa

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
