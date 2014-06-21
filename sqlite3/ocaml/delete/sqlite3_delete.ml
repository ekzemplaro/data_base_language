(* ------------------------------------------------------------------- *)
(*
	sqlite3_delete.ml

					Jun/16/2011

*)
(* ------------------------------------------------------------------- *)
open Printf
open Sqlite3

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
let sql_delete_proc = fun db id_in -> 
  let sql_str = sprintf
 "delete from cities where id = '" ^ id_in ^ "'"
 in
    print_endline sql_str;
    sql_execute_proc db sql_str

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let _ = printf "%s\n" Sys.argv.(1)
let _ = printf "%s\n" Sys.argv.(2)

let _ = let db = db_open Sys.argv.(1) in
		sql_delete_proc db (Sys.argv.(2))

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
