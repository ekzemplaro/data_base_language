(* ------------------------------------------------------------------- *)
(*
	mysql_create.ml

						Nov/19/2013

*)
(* ------------------------------------------------------------------- *)
open Printf
open Mysql

exception Dummy
(* ------------------------------------------------------------------- *)
let sql_insert_proc = fun db id_in name_in population_in date_mod_in -> 
  let sql_str = sprintf
 "insert into cities (id, Name, Population, date_mod) values (\'"
 ^ id_in ^ "\',\'" ^ name_in ^ "\',"
 ^ string_of_int population_in ^ ",\'" ^ date_mod_in ^ "\')" in
    exec db sql_str

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let sql_aa = sprintf "SET NAMES utf8"
let sql_bb = sprintf "drop table cities"
let sql_cc = sprintf "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY, name text, population int, date_mod text)"

let _ =
	let db = quick_connect ~host:"host_mysql" ~database:"city" ~user:"scott" ~password:"tiger" ()
		in
			exec db sql_aa;
			exec db sql_bb;
			exec db sql_cc;
	sql_insert_proc db "t3321" "岡山" 51436 "1995-9-21";
	sql_insert_proc db "t3322" "倉敷" 48517 "1995-2-12";
	sql_insert_proc db "t3323" "津山" 73192 "1995-1-24";
	sql_insert_proc db "t3324" "玉野" 67925 "1995-5-22";
	sql_insert_proc db "t3325" "笠岡" 48291 "1995-9-14";
	sql_insert_proc db "t3326" "井原" 36728 "1995-3-15";
	sql_insert_proc db "t3327" "総社" 84519 "1995-7-19";
	sql_insert_proc db "t3328" "高梁" 93587 "1995-8-18";
	sql_insert_proc db "t3329" "新見" 71642 "1995-10-25"
(*
			disconnect db
*)


let _ =	print_endline "*** qqqqq ***"
let _ =	print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
