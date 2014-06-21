(* ------------------------------------------------------------------- *)
(*
	couch_create.ml

					Mar/14/2013

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Json_type
open	Curl_manipulate
(* ------------------------------------------------------------------- *)

let city_xx = Object ["t2021",Object ["name", String "長野";
                   "population", Int 51368; "date_mod", String "1995-5-21"];
		"t2022",Object ["name", String "松本";
                   "population", Int 58362; "date_mod", String "1995-9-30"];
		"t2023",Object ["name", String "上田";
                   "population", Int 82475; "date_mod", String "1995-4-12"];
		"t2024", Object ["name", String "小諸";
                   "population", Int 72369; "date_mod", String "1995-8-25"];
		"t2025", Object ["name", String "岡谷";
                   "population", Int 42953; "date_mod", String "1995-9-18"];
		"t2026", Object ["name", String "塩尻";
                   "population", Int 72648; "date_mod", String "1995-2-8"];
		"t2027", Object ["name", String "茅野";
                   "population", Int 62846; "date_mod", String "1995-4-14"];
		"t2028", Object ["name", String "飯田";
                   "population", Int 25719; "date_mod", String "1995-9-23"];
		"t2029", Object ["name", String "中野";
                   "population", Int 52987; "date_mod", String "1995-12-18"];
		"t2030", Object ["name", String "諏訪";
                   "population", Int 29856; "date_mod", String "1995-2-12"];
		"t2031", Object ["name", String "駒ヶ根";
                   "population", Int 32745; "date_mod", String "1995-4-15"];
		"t2032", Object ["name", String "佐久";
                   "population", Int 85972; "date_mod", String "1995-6-27"];
		"t2033", Object ["name", String "伊那";
                   "population", Int 52918; "date_mod", String "1995-7-25"];
		"t2034", Object ["name", String "千曲";
                   "population", Int 61479; "date_mod", String "1995-8-17"]]

(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"
let url_collection = "http://host_dbase:5984/city"
let url_target = url_collection ^ "/cities"

let str_json = Json_io.string_of_json city_xx


let _ =
	let r,c = delete url_collection in
		printf "%d -> %s\n" r c

let _ =
	let r,c = put url_collection "" in
		printf "%d -> %s\n" r c

let _ =
	let r,c = put url_target str_json in
		printf "%d -> %s\n" r c

let _ = print_endline "*** 終了 ***"
(* ------------------------------------------------------------------- *)
