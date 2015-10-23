(* ------------------------------------------------------------------- *)
(*
	csv_update.ml

					Aug/23/2011

*)
(* ------------------------------------------------------------------- *)
open	Str
open	Printf
open	Text_manipulate
(* ------------------------------------------------------------------- *)
let file_text = Sys.argv.(1)
let key = Sys.argv.(2)
let population_in = int_of_string Sys.argv.(3)
let _ =	printf "%s\n" key
let _ =	printf "%d\n" population_in

let _ =  print_endline "*** 開始 ***"
let dict_aa = Hashtbl.create 100
let _ = csv_read_proc file_text dict_aa

let _ = dict_update_proc dict_aa key population_in

let _ =	dict_display_proc dict_aa
let _ = csv_write_proc file_text dict_aa
let _ = print_endline "*** 終了 ***"

(* ------------------------------------------------------------------- *)

