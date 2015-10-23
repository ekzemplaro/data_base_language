(* ------------------------------------------------------------------- *)
(*
	json_manipulate.ml

					Jul/25/2012

*)
(* ------------------------------------------------------------------- *)
open	Json_type
open	Json_type.Browse
open	Text_manipulate
(* ------------------------------------------------------------------- *)
let json_record_convert_proc key tbl_in dict_aa =
	let xx = fieldx tbl_in key
	in
		if (xx != Null)
		then
			let ttx = make_table (objekt xx)
	in
		dict_append_proc dict_aa key (string (field ttx "name"))
			(int (field ttx "population"))
			(string (field ttx "date_mod"))

(* ------------------------------------------------------------------- *)
let json_obj_to_dict_proc json_obj dict_aa = 
	let tbl_top = make_table (objekt json_obj)
	in
		let _ = Hashtbl.iter (fun key value ->
			if (String.compare key "_id") != 0
			 && (String.compare key "_rev") != 0 then
			 json_record_convert_proc key tbl_top dict_aa) tbl_top
	in
		()
(* ------------------------------------------------------------------- *)
let json_to_dict_proc str_json dict_aa =
	let json_obj = Json_io.json_of_string str_json
	in
 		json_obj_to_dict_proc json_obj dict_aa
(* ------------------------------------------------------------------- *)
let show_json_str_proc str_json =
	let json_obj = Json_io.json_of_string str_json
	in
		let dict_aa = Hashtbl.create 100
	in
 		let _ = json_obj_to_dict_proc json_obj dict_aa
	in
		dict_display_proc dict_aa
(* ------------------------------------------------------------------- *)
