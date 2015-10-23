(* ------------------------------------------------------------------- *)
(*
	mysql_update.ml

						Feb/09/2012

*)
(* ------------------------------------------------------------------- *)
open Printf
open Mysql
open	Text_manipulate

exception Dummy
(* ------------------------------------------------------------------- *)
let sql_update_proc = fun db id_in population_in today -> 
	let sql_str = sprintf
	"update cities set population=" ^ string_of_int population_in 
	^ ",date_mod = '" ^ today
	^ "' where id = '" ^ id_in ^ "'"
	in
		print_endline sql_str;
		exec db sql_str


(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let _ =	printf "%s\t" Sys.argv.(1)
let _ =	printf "%s\n" Sys.argv.(2)

let today = get_current_date_proc

let _ = Printf.printf "%s\n" today

let _ =
	let db = quick_connect ~host:"host_mysql" ~database:"city" ~user:"scott" ~password:"tiger" ()
		in
		sql_update_proc db Sys.argv.(1)
			(int_of_string Sys.argv.(2)) today


(*			disconnect db
*)


let _ =	print_endline "*** qqqqq ***"
let _ =	print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
