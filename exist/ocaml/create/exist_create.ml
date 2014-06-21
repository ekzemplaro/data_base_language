(* ------------------------------------------------------------------- *)
(*
	exist_create.ml

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
	in let _ = dict_append_proc dict_aa "t4251" "長崎" 75492 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t4252" "佐世保" 32645 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t4253" "島原" 17826 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t4254" "大村" 82631 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t4255" "諫早" 64325 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t4256" "五島" 72698 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t4257" "平戸" 82395 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t4258" "雲仙" 25676 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t4259" "松浦" 47821 "1995-10-5"
	in
		dict_aa

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://localhost:8086/exist/rest/db/cities/cities.xml"
let file_xml = "/tmp/tmp017_nagasaki.xml"
let file_xml_bb = "/tmp/tmp018_nagasaki.xml"

let dict_aa = data_prepare_proc ()

let _ = dict_to_xml_file_proc file_xml dict_aa

let _ = print_endline "*** check bbb ***"

let _ = curl_put_proc file_xml_bb url_target

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
