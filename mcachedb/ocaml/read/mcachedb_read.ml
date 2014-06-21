(* ------------------------------------------------------------------- *)
(*
	mcachedb_read.ml

					Feb/08/2012
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

let cache = Memcache.open_connection "localhost" 21201

let keys = ["t1521"; "t1522"; "t1523";"t1524";"t1525";
	 "t1526"; "t1527";"t1528";"t1529";
	 "t1530"; "t1531";"t1532"]

let _= out_proc cache keys

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
