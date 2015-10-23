(* ------------------------------------------------------------------- *)
(*
	mcached_create.ml

					Jul/10/2011
*)
(* ------------------------------------------------------------------- *)
open Memcache
open Json_type
open Json_type.Browse
open	Unix

type unit = {name:string; population:int; date_mod:string}

(* ------------------------------------------------------------------- *)
let insert_record cache_aa key name population date_mod = 
	let city = Object ["name", String name;
                   "population", Int population; "date_mod", String date_mod]
	in let str_json = Json_io.string_of_json city
	in
		Printf.printf "%s\t" key;
		Printf.printf "%s\t" name;
		Printf.printf "%d\t" population;
		Printf.printf "%s\n" date_mod;
		Printf.printf "%s\n" str_json;
		Memcache.set cache_aa key str_json
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"


let _ = Printf.printf "version: %s\n" Memcache.version

let t = Unix.localtime (Unix.time ());;
let (day, month, year) = (t.tm_mday, t.tm_mon, t.tm_year)
let today = string_of_int (1900 + year) ^ "-" ^ string_of_int (month + 1)
	^ "-" ^string_of_int day
let _ = Printf.printf "%s\n" today

let cache = Memcache.open_connection "localhost" 11211

let _ = insert_record cache "t1731" "金沢" 34215 "1995-3-12"
let _ = insert_record cache "t1732" "輪島" 58762 "1995-9-24"
let _ = insert_record cache "t1733" "小松" 21594 "1995-6-9"
let _ = insert_record cache "t1734" "七尾" 59487 "1995-3-12"
let _ = insert_record cache "t1735" "珠洲" 48723 "1995-8-24"
let _ = insert_record cache "t1736" "加賀" 67812 "1995-4-9"
let _ = insert_record cache "t1737" "羽咋" 81259 "1995-6-11"
let _ = insert_record cache "t1738" "かほく" 25738 "1995-1-24"
let _ = insert_record cache "t1739" "白山" 79231 "1995-5-19"

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
