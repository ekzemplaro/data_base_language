(* ------------------------------------------------------------------- *)
(*
	json_create.ml

				Jun/17/2013

*)
(* ------------------------------------------------------------------- *)
open	Json_type
open	Text_manipulate

type unit = {name:string; population:int; date_mod:string}

(* ------------------------------------------------------------------- *)
let data_prepare_proc = fun () ->
	let dict_aa = Hashtbl.create 100
	in let _ = dict_append_proc dict_aa "t0921" "宇都宮" 84759 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t0922" "小山" 31786 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t0923" "佐野" 17824 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t0924" "足利" 82631 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t0925" "日光" 64325 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t0926" "下野" 72698 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t0927" "さくら" 81735 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t0928" "矢板" 25671 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t0929" "真岡" 47821 "1995-10-5"
	in let _ = dict_append_proc dict_aa "t0930" "栃木" 21578 "1995-8-7"
	in let _ = dict_append_proc dict_aa "t0931" "大田原" 59341 "1995-4-6"
	in let _ = dict_append_proc dict_aa "t0932" "鹿沼" 92675 "1995-2-10"
	in let _ = dict_append_proc dict_aa "t0933" "那須塩原" 76215 "1995-3-21"
	in let _ = dict_append_proc dict_aa "t0934" "那須烏山" 42158 "1995-7-17"
	in
		dict_aa
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"


let city_xx = Object ["t0921",Object ["name", String "宇都宮";
                   "population", Int 35127; "date_mod", String "1995-3-21"];
		"t0922",Object ["name", String "小山";
                   "population", Int 94583; "date_mod", String "1995-7-30"];
		"t0923",Object ["name", String "佐野";
                   "population", Int 82471; "date_mod", String "1995-5-12"];
		"t0924", Object ["name", String "足利";
                   "population", Int 72369; "date_mod", String "1995-8-25"];
		"t0925", Object ["name", String "日光";
                   "population", Int 42953; "date_mod", String "1995-9-18"];
		"t0926", Object ["name", String "下野";
                   "population", Int 72648; "date_mod", String "1995-2-8"];
		"t0927", Object ["name", String "さくら";
                   "population", Int 62845; "date_mod", String "1995-4-14"];
		"t0928", Object ["name", String "矢板";
                   "population", Int 25719; "date_mod", String "1995-9-23"];
		"t0929", Object ["name", String "真岡";
                   "population", Int 52987; "date_mod", String "1995-12-18"];
		"t0930", Object ["name", String "栃木";
                   "population", Int 29856; "date_mod", String "1995-2-12"];
		"t0931", Object ["name", String "大田原";
                   "population", Int 32745; "date_mod", String "1995-4-15"];
		"t0932", Object ["name", String "鹿沼";
                   "population", Int 82975; "date_mod", String "1995-6-27"];
		"t0933", Object ["name", String "那須塩原";
                   "population", Int 52918; "date_mod", String "1995-7-25"];
		"t0934", Object ["name", String "那須烏山";
                   "population", Int 62419; "date_mod", String "1995-8-17"]]

let city_aa = data_prepare_proc ()
(*
let obj = Object city_aa
*)

let json_file = Sys.argv.(1)

let _ = Json_io.save_json json_file city_xx

let _ = print_endline "*** 終了 ***";;

(* ------------------------------------------------------------------- *)
