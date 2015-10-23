(* ------------------------------------------------------------------- *)
(*
	xml_manipulate.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Unix
open	Str
open	Xml
open	Printf
open	Text_manipulate

(* ------------------------------------------------------------------- *)
(*
type unit_template = {name:string; population:int; date_mod:string}
*)
(* ------------------------------------------------------------------- *)
let xml_parser_s2 xml_bb =
	Xml.iter (function unit ->
		Printf.printf "%s\t" (Xml.to_string_fmt unit)
		  ) xml_bb
(* ------------------------------------------------------------------- *)
let rec print_record_s2 lst =
	match lst with
		[] -> ()
		| first::rest  -> xml_parser_s2 first;
			print_record_s2 rest
(* ------------------------------------------------------------------- *)
let print_record unit =
	match unit with
		Element (label,_,lst) ->
			Printf.printf "%s\t" label;
			print_record_s2 lst;
			Printf.printf "\n"
		| _ -> ()

(* ------------------------------------------------------------------- *)
let xml_display_proc doc =
	Xml.iter (function unit -> print_record unit) doc


(* ------------------------------------------------------------------- *)
let show_xml_str_proc str_xml =
	let doc = Xml.parse_string str_xml
	in
		let _ = xml_display_proc doc
	in
		()
(* ------------------------------------------------------------------- *)
let join_proc = fun key name population date_mod ->
		"<" ^ key ^ ">"
		^ "<name>" ^ name ^ "</name>"
		^ "<population>" ^ string_of_int population ^ "</population>"
		^ "<date_mod>" ^ date_mod ^ "</date_mod>"
		^ "</" ^ key ^ ">"

(* ------------------------------------------------------------------- *)
let xml_convert_proc_unit oc key unit_aa =
	match unit_aa with
		{name = nx; population = px; date_mod = dx} ->	
	let str_out = join_proc key nx
		unit_aa.population unit_aa.date_mod
	in
	fprintf oc "%s\n" str_out

(* ------------------------------------------------------------------- *)
let dict_to_xml_file_proc = fun file_xml dict_aa ->
	let oc = open_out file_xml
	in
		let _ = fprintf oc "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
	in
		let _ = fprintf oc "<root>\n"
	in
		let _ = Hashtbl.iter
		(fun key value -> xml_convert_proc_unit oc key value) dict_aa
	in
		let _ = fprintf oc "</root>\n"
	in
		let _= close_out oc
	in
		()
(* ------------------------------------------------------------------- *)
(* ------------------------------------------------------------------- *)
