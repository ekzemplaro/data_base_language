(* ------------------------------------------------------------------- *)
(*
	tyrant_delete.ml

					Jun/23/2011
*)
(* ------------------------------------------------------------------- *)
open Memcache
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let key = Sys.argv.(1)

let _ = Printf.printf "%s\n" key

let _ = Printf.printf "version: %s\n" Memcache.version

let cache = Memcache.open_connection "localhost" 1978

let _ = Memcache.delete cache key

let _ =  Memcache.close_connection cache

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
