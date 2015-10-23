(* ------------------------------------------------------------------- *)
(*
	text_manipulate.ml

					Jul/25/2012

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Str
open	Unix
(* ------------------------------------------------------------------- *)
type unit_template = {name:string; population:int; date_mod:string}


(* ------------------------------------------------------------------- *)
let dict_append_proc = fun dict_aa key name_in population_in date_mod_in ->
	Hashtbl.add dict_aa key
	{name= name_in; population= population_in; date_mod= date_mod_in}
(* ------------------------------------------------------------------- *)
let text_read_proc_exec = fun file_text dict_aa delimit ->
	let ic = open_in file_text in
	try while true do
		let cols = (split (regexp delimit) (input_line ic))
		in
		dict_append_proc dict_aa (List.nth cols 0)
			 (List.nth cols 1)
			 (int_of_string (List.nth cols 2))
			 (List.nth cols 3)
	done with End_of_file ->
		close_in ic;
	print_endline "*** text_read_proc *** ppp ***";
	print_endline "*** text_read_proc *** qqq ***"

(* ------------------------------------------------------------------- *)
let text_read_proc = fun file_text dict_aa ->
	let delimit = "[\t]+"
	in
	text_read_proc_exec file_text dict_aa delimit
(* ------------------------------------------------------------------- *)
let join_proc = fun key uu delimit ->
	key ^ delimit ^ uu.name ^ delimit ^ (string_of_int uu.population)
		^ delimit ^ uu.date_mod
(* ------------------------------------------------------------------- *)
let out_str_proc  = fun oc delimit key_aa unit_aa ->
	fprintf oc "%s\n" (join_proc key_aa unit_aa delimit)
(* ------------------------------------------------------------------- *)
let text_write_proc_exec = fun text_file dict_aa delimit ->
	let oc = open_out text_file in
		Hashtbl.iter (fun key value ->
			out_str_proc oc delimit key value) dict_aa;
		close_out oc

(* ------------------------------------------------------------------- *)
let text_write_proc = fun text_file dict_aa ->
	let delimit = "\t"
	in text_write_proc_exec text_file dict_aa delimit
(* ------------------------------------------------------------------- *)
let record_display_proc = fun key unit_aa ->
	printf "%s\t" key;
	printf "%s\t" unit_aa.name;
	printf "%d\t" unit_aa.population;
	printf "%s\n" unit_aa.date_mod


(* ------------------------------------------------------------------- *)
let dict_display_proc = fun dict_aa ->
	Hashtbl.iter record_display_proc dict_aa
(* ------------------------------------------------------------------- *)
(*
let get_current_date_proc = fun () ->
	let t = Unix.localtime (Unix.time ())
	in let (day, month, year) = (t.tm_mday, t.tm_mon, t.tm_year)
	in let today = string_of_int (1900 + year) ^ "-" ^ string_of_int (month + 1)
	^ "-" ^string_of_int day
	in today
*)
let get_current_date_proc = 
		let t = Unix.localtime (Unix.time ())
	in
		let (day, month, year) = (t.tm_mday, t.tm_mon, t.tm_year)
	in
		 string_of_int (1900 + year) ^ "-" ^
			string_of_int (month + 1) ^ "-" ^string_of_int day

(* ------------------------------------------------------------------- *)
let dict_update_proc = fun dict_aa key population_in ->
	let _ =	printf "%s\n" key
	in let _ =	printf "%d\n" population_in
	in let unit_aa = Hashtbl.find dict_aa key
	in let today = get_current_date_proc
	in let unit_new = {name= unit_aa.name; population= population_in; date_mod= today}

	in let _ = Hashtbl.replace dict_aa key unit_new
	in
	0
(* ------------------------------------------------------------------- *)
let csv_read_proc = fun file_text dict_aa ->
	let delimit = "[,]+"
	in
	text_read_proc_exec file_text dict_aa delimit
(* ------------------------------------------------------------------- *)
let csv_write_proc = fun text_file dict_aa ->
	let delimit = ","
	in text_write_proc_exec text_file dict_aa delimit
(* ------------------------------------------------------------------- *)
(* ------------------------------------------------------------------- *)
let rec file_to_str_proc filename =
	let stat = Unix.stat filename in
	let size = stat.Unix.st_size in
	let ii = open_in filename in
	let buffer = String.make size '\000' in
	begin
		ignore (really_input ii buffer 0 size);
		close_in ii;
		buffer
	end
(* ------------------------------------------------------------------- *)
