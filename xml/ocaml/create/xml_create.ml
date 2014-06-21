(* ------------------------------------------------------------------- *)
(*
	xml_create.ml

				Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Str
open	Text_manipulate
open	Xml_manipulate

(* ------------------------------------------------------------------- *)
let data_prepare_proc = fun () ->
	let dict_aa = Hashtbl.create 100
	in let _ = dict_append_proc dict_aa "t2261" "静岡" 31754 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t2262" "浜松" 38926 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t2263" "沼津" 17826 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t2264" "三島" 82631 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t2265" "富士" 64325 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t2266" "熱海" 72698 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t2267" "富士宮" 82715 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t2268" "藤枝" 25676 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t2269" "御殿場" 47821 "1995-10-5"
	in let _ = dict_append_proc dict_aa "t2270" "島田" 18356 "1995-3-21"
	in
		dict_aa
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let _ =print_endline "*** aaaa ***"

let file_xml = Sys.argv.(1)

let dict_aa = data_prepare_proc ()

let _ = dict_to_xml_file_proc file_xml dict_aa

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
