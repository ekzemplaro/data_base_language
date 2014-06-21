(* ------------------------------------------------------------------- *)
(*
	tyrant_read.ml

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

let cache = Memcache.open_connection "localhost" 1978

let keys = ["t4761"; "t4762"; "t4763";"t4764";"t4765";
	 "t4766"; "t4767";"t4768";"t4769"]

let _= out_proc cache keys

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
