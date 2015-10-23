(* ------------------------------------------------------------------- *)
(*
	sqlite3_update.ml

					Feb/09/2012

*)
(* ------------------------------------------------------------------- *)
open Printf
open Sqlite3
open	Text_manipulate

exception Dummy
(* ------------------------------------------------------------------- *)
let sql_execute_proc = fun db sql_str -> 
	try
	match
	exec db sql_str ~cb:(fun _ _ -> print_endline "FOUND!"; raise Dummy)
	with
	| Rc.OK -> print_endline "OK"
	| _ -> assert false
	with xcp -> print_endline (Printexc.to_string xcp)
	
(* ------------------------------------------------------------------- *)
let sql_update_proc = fun db id_in population_in today ->
	let sql_str = sprintf
	"update cities set population=" ^ string_of_int population_in 
		^ ",date_mod = '" ^ today
		^ "' where id = '" ^ id_in ^ "'"
	in
		print_endline sql_str;
		sql_execute_proc db sql_str

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let _ =	printf "%s\n" Sys.argv.(1)
let _ =	printf "%s\n" Sys.argv.(2)
let _ =	printf "%s\n" Sys.argv.(3)

let today = get_current_date_proc
let _ = Printf.printf "%s" today

let _ =	let db = db_open Sys.argv.(1) in
		sql_update_proc db (Sys.argv.(2))
			(int_of_string Sys.argv.(3)) today

let _ =	print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
