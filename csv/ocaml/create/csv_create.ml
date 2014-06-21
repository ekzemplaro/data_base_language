(* ------------------------------------------------------------------- *)
(*
	csv_create.ml

					Aug/23/2011

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Text_manipulate
(* ------------------------------------------------------------------- *)
type unit = {name:string; population:int; date_mod:string}

(* ------------------------------------------------------------------- *)
let data_prepare_proc = fun () ->
	let dict_aa = Hashtbl.create 100
	in let _ = dict_append_proc dict_aa "t1271" "千葉" 31756 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t1272" "勝浦" 83912 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t1273" "市原" 12656 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t1274" "流山" 83139 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t1275" "八千代" 64325 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t1276" "我孫子" 72698 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t1277" "鴨川" 82375 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t1278" "銚子" 25476 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t1279" "市川" 47921 "1995-10-5"
	in
		dict_aa
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let dict_aa = data_prepare_proc ()

let _ = dict_display_proc dict_aa

let _ = let text_file = Sys.argv.(1)
	in
	printf "%s\n" text_file;
	csv_write_proc text_file dict_aa

let _ = print_endline "*** 終了 ***"

(* ------------------------------------------------------------------- *)
