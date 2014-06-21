(* ------------------------------------------------------------------- *)
(*
	json_delete.ml

					Feb/09/2012
*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Json_type
open	Json_type.Browse

(* ------------------------------------------------------------------- *)
let print_record key tbl_in = let xx = fieldx tbl_in key
	in
		if (xx != Null) then
			let ttx = make_table (objekt xx)
	in
		Printf.printf "%s\t" key;
		Printf.printf "%s\t" (string (field ttx "name"));
		Printf.printf "%d\t" (int (field ttx "population"));
		Printf.printf "%s\n" (string (field ttx "date_mod"))

(* ------------------------------------------------------------------- *)
let json_file = Sys.argv.(1)
let json_obj = Json_io.load_json json_file
let key = Sys.argv.(2)
let _ =	printf "%s\n" key

let tbl_top = make_table (objekt json_obj)

let _ = Hashtbl.remove tbl_top key

let _ = Hashtbl.iter (fun key value -> print_record key tbl_top) tbl_top

(*
let json_obj_bb = Json_type.Build.object tbl_top
*)
let _ = Json_io.save_json "tmp001.json" tbl_top

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
