(* ------------------------------------------------------------------- *)
(*
	mysql_read.ml

					Jun/16/2011

*)
(* ------------------------------------------------------------------- *)
open Printf
open Mysql

let _ = print_endline "*** 開始 ***"
let _ = print_endline "*** aaaa ***"

let sql_aa = sprintf "SET NAMES utf8"

let _ =
	let db =
		quick_connect ~host:"host_mysql" ~database:"city" ~user:"scott" ~password:"tiger" ()
		in
		exec db sql_aa;
		let print row =
			printf "%s\t%s\t%d\t%s\n"
				(not_null str2ml row.(0))
				(not_null str2ml row.(1))
				(not_null int2ml row.(2))
				(not_null str2ml row.(3))
			in
			iter (exec db "select id,name,population,date_mod from cities") print;
			disconnect db



let _ = print_endline "*** ppppp ***"
let _ = print_endline "*** qqqqq ***"
let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
