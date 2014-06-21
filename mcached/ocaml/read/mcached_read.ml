(* ------------------------------------------------------------------- *)
(*
	mcached_read.ml

					Feb/08/2011
*)
(* ------------------------------------------------------------------- *)
open String
open Memcache
open Json_type
open Json_type.Browse

open Mcached_manipulate

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let _ = Printf.printf "version: %s\n" Memcache.version

let cache = Memcache.open_connection "localhost" 11211

let keys = ["t1731"; "t1732"; "t1733";"t1734";"t1735";
	 "t1736"; "t1737";"t1738";"t1739"]

let _= out_proc cache keys

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
