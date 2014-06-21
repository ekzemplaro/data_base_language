(* ------------------------------------------------------------------- *)
(*
	mcached_manipulate.ml

					Feb/09/2011
*)
(* ------------------------------------------------------------------- *)
open String
open Memcache
open Json_type
open Json_type.Browse

open Unix
(* ------------------------------------------------------------------- *)
let print_record cache_aa key = 
	let value = Memcache.get cache_aa key
	in 
		if (length value != 0) then
			let json_obj = Json_io.json_of_string value
	in 
			let ttx = make_table (objekt json_obj)
	in
		Printf.printf "%s\t" key;
		Printf.printf "%s\t" (string (field ttx "name"));
		Printf.printf "%d\t" (int (field ttx "population"));
	Printf.printf "%s\n" (string (field ttx "date_mod"))
(* ------------------------------------------------------------------- *)
let rec out_proc cache_aa lst = match lst with
	[] -> 0
	| first :: rest -> print_record cache_aa first ; out_proc cache_aa rest

(* ------------------------------------------------------------------- *)
let update_record cache_aa key population todayx = 
	let value = Memcache.get cache_aa key
	in 
		Printf.printf "key = %s\n" key;
		Printf.printf "value = %s\n" value;
		if (length value != 0) then
			let json_obj = Json_io.json_of_string value
	in 
		let ttx = make_table (objekt json_obj)
	in let name = string (field ttx "name")
(*
*)
	in let city = Object ["name", String name;
                   "population", Int population; "date_mod", String todayx]
	in let str_json = Json_io.string_of_json city
	in
		Printf.printf "%s\t" key;
		Printf.printf "%s\t" name;
		Printf.printf "%d\t" population;
		Printf.printf "%s\n" todayx;
		Printf.printf "%s\n" str_json;
		Memcache.set cache_aa key str_json
(* ------------------------------------------------------------------- *)
