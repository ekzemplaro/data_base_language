(* ------------------------------------------------------------------- *)
(*
	json_update.ml

					Apr/09/2013
*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Json_type
open	Json_type.Browse

open	Text_manipulate
open	Json_manipulate
(* ------------------------------------------------------------------- *)
let json_file = Sys.argv.(1)
let key = Sys.argv.(2)
let population_in = int_of_string Sys.argv.(3)
let _ =	printf "%s\n" key
let _ =	printf "%d\n" population_in

let json_str = file_to_str_proc json_file
let dict_aa = Hashtbl.create 100
let _ = json_to_dict_proc json_str dict_aa
let dict_bb = dict_update_proc dict_aa key population_in



(*
let _ = dict_update_proc dict_aa key population_in
let _ = Hashtbl.iter (fun key value -> print_record key dict_aa) dict_aa
*)


(*
let json_obj_bb = Json_type.Build.object dict_aa
let _ = Json_io.save_json "tmp001.json" dict_aa
*)

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
