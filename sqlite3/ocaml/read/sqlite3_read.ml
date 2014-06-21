(* ------------------------------------------------------------------- *)
(*
	sqlite3_update.ml

					Dec/24/2010

*)
(* ------------------------------------------------------------------- *)
open Printf
open Sqlite3

let file_in = Sys.argv.(1)
let _ =
	print_endline "*** 開始 ***";
	printf "%s\n" file_in;
	print_endline "*** pppp ***";

	let db = db_open file_in in
	print_endline "*** qqqq ***";
	ignore(exec_not_null db 
		(fun row headers ->
			Array.iter(fun el -> Printf.printf "%s\t" el) row;
			Printf.printf "\n";
		) "SELECT id,name,population,date_mod FROM cities"); 
	print_endline "*** 終了 ***";
	db_close db;

(* ------------------------------------------------------------------- *)
