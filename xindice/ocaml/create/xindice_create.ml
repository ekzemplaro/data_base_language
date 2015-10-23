(* ------------------------------------------------------------------- *)
(*
	xindice_create.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Str
open	Text_manipulate
open	Xml_manipulate
open	Curl_manipulate
(* ------------------------------------------------------------------- *)
let data_prepare_proc = fun () ->
	let dict_aa = Hashtbl.create 100
	in let _ = dict_append_proc dict_aa "t0271" "青森" 75492 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t0272" "弘前" 32645 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t0273" "八戸" 17826 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t0274" "三沢" 82631 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t0275" "黒石" 64325 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t0276" "むつ" 72698 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t0277" "五所川原" 82395 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t0278" "十和田" 25676 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t0279" "平川" 47821 "1995-10-5"
	in
		dict_aa

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://172.20.129.189:8888/xindice/db/cities/cities"
let file_xml = "/tmp/tmp014_aomori.xml"
let file_xml_bb = "/tmp/tmp015_aomori.xml"

let dict_aa = data_prepare_proc ()

let _ = dict_to_xml_file_proc file_xml dict_aa

let _ = print_endline "*** check bbb ***"

let _ = curl_put_proc file_xml url_target

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
