(* ------------------------------------------------------------------- *)
(*
	mysql_delete.ml

						Jun/17/2011

*)
(* ------------------------------------------------------------------- *)
open Printf
open Mysql

exception Dummy
(* ------------------------------------------------------------------- *)
let sql_delete_proc = fun db id_in -> 
	let sql_str = sprintf
	"delete from cities where id = '" ^ id_in ^ "'"
	in
		print_endline sql_str;
		exec db sql_str


(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let _ =	printf "%s\t" Sys.argv.(1)


let _ =
	let db = quick_connect ~host:"host_mysql" ~database:"city" ~user:"scott" ~password:"tiger" ()
		in
		sql_delete_proc db Sys.argv.(1)


(*			disconnect db
*)


let _ =	print_endline "*** qqqqq ***"
let _ =	print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
