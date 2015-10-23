(* ------------------------------------------------------------------- *)
(*
	webdav_create.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Json_type
open	Curl_manipulate
(* ------------------------------------------------------------------- *)

let city_xx = Object ["t1351",Object ["name", String "八王子";
                   "population", Int 51274; "date_mod", String "1995-3-21"];
		"t1352",Object ["name", String "立川";
                   "population", Int 58362; "date_mod", String "1995-7-30"];
		"t1353",Object ["name", String "武蔵野";
                   "population", Int 82476; "date_mod", String "1995-5-12"];
		"t1354", Object ["name", String "三鷹";
                   "population", Int 72369; "date_mod", String "1995-8-25"];
		"t1355", Object ["name", String "青梅";
                   "population", Int 42953; "date_mod", String "1995-9-18"];
		"t1356", Object ["name", String "府中";
                   "population", Int 72648; "date_mod", String "1995-2-8"];
		"t1357", Object ["name", String "昭島";
                   "population", Int 62846; "date_mod", String "1995-4-14"];
		"t1358", Object ["name", String "調布";
                   "population", Int 25719; "date_mod", String "1995-9-23"];
		"t1359", Object ["name", String "町田";
                   "population", Int 52987; "date_mod", String "1995-12-18"]]

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_target = "http://host_dbase:3004/city/tokyo.json"

let str_json = Json_io.string_of_json  city_xx

let _ =
	let r,c = put url_target str_json in
		printf "%d -> %s\n" r c


let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
