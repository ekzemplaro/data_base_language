(* ------------------------------------------------------------------- *)
(*
	text_delete.ml

					Jul/09/2015

*)
(* ------------------------------------------------------------------- *)
open Printf
open Text_manipulate
(* ------------------------------------------------------------------- *)
let file_text = Sys.argv.(1)
let key = Sys.argv.(2)
let _ =	printf "%s\n" key

let _ =  print_endline "*** 開始 ***"
let dict_aa = Hashtbl.create 100
let _ = text_read_proc file_text dict_aa

let unit_aa =
try
	Hashtbl.find dict_aa key
with Not_found ->
	{name= ""; population= 0; date_mod= ""}

let _ = record_display_proc key unit_aa


let _ = Hashtbl.remove dict_aa key

let _ = text_write_proc file_text dict_aa
let _ = print_endline "*** 終了 ***"

(* ------------------------------------------------------------------- *)

