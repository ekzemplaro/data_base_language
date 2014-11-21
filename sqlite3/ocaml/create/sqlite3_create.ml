(* ------------------------------------------------------------------- *)
(*
	sqlite3_create.ml

					Nov/21/2014

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
	with xcp -> print_endline (Printexc.to_string xcp);;
	
(* ------------------------------------------------------------------- *)
let sql_insert_proc = fun db id_in name_in population_in date_mod_in -> 
  let sql_str = sprintf
 "insert into cities (id, Name, Population, date_mod) values (\'"
 ^ id_in ^ "\',\'" ^ name_in ^ "\',"
 ^ string_of_int population_in ^ ",\'" ^ date_mod_in ^ "\')" in
(*    print_endline sql_str *)
    sql_execute_proc db sql_str

(* ------------------------------------------------------------------- *)
let () =
	print_endline "*** 開始 ***";
	printf "%s\n" Sys.argv.(1);

	let db = db_open Sys.argv.(1) in

	let sql_aa = sprintf "drop table if exist cities" in
		sql_execute_proc db sql_aa ;

	let sql_bb = sprintf "create TABLE cities ( id varchar(10) NOT NULL PRIMARY KEY, name text, population int, date_mod text)" in
		sql_execute_proc db sql_bb ;

	sql_insert_proc db "t0711" "郡山" 51936 "1995-9-21";
	sql_insert_proc db "t0712" "会津若松" 48517 "1995-3-12";
	sql_insert_proc db "t0713" "白河" 72395 "1995-7-24";
	sql_insert_proc db "t0714" "福島" 62561 "1995-5-22";
	sql_insert_proc db "t0715" "喜多方" 42597 "1995-9-14";
	sql_insert_proc db "t0716" "二本松" 37528 "1995-3-15";
	sql_insert_proc db "t0717" "いわき" 84519 "1995-7-19";
	sql_insert_proc db "t0718" "相馬" 21587 "1995-8-18";
	sql_insert_proc db "t0719" "須賀川" 41642 "1995-10-25";
	print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
