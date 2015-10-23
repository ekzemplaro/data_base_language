(* ------------------------------------------------------------------- *)
(*
	mcached_update.ml

					Feb/09/2012
*)
(* ------------------------------------------------------------------- *)
open Memcache
open Json_type
open Json_type.Browse
open	Unix
open	Text_manipulate
open	Mcached_manipulate

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let key = Sys.argv.(1)
let population = int_of_string Sys.argv.(2)

let _ = Printf.printf "%s\t" key
let _ = Printf.printf "%d\n" population

let _ = Printf.printf "version: %s\n" Memcache.version

let today = get_current_date_proc

let _ = Printf.printf "%s\n" today

let cache = Memcache.open_connection "localhost" 11211

let _ = update_record cache key population today

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
