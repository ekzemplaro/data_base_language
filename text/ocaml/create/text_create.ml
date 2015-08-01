(* ------------------------------------------------------------------- *)
(*
	text_create.ml

					Jul/09/2015

*)
(* ------------------------------------------------------------------- *)
open	Printf
open	Text_manipulate
(* ------------------------------------------------------------------- *)
type unit = {name:string; population:int; date_mod:string}

(* ------------------------------------------------------------------- *)
let data_prepare_proc = fun () ->
	let dict_aa = Hashtbl.create 100
	in let _ = dict_append_proc dict_aa "t2381" "名古屋" 42317 "1995-4-20"
	in let _ = dict_append_proc dict_aa "t2382" "豊橋" 31489 "1995-7-12"
	in let _ = dict_append_proc dict_aa "t2383" "岡崎" 17326 "1995-5-21"
	in let _ = dict_append_proc dict_aa "t2384" "一宮" 82531 "1995-3-24"
	in let _ = dict_append_proc dict_aa "t2385" "蒲郡" 64125 "1995-8-18"
	in let _ = dict_append_proc dict_aa "t2386" "常滑" 72598 "1995-9-8"
	in let _ = dict_append_proc dict_aa "t2387" "大府" 82735 "1995-2-17"
	in let _ = dict_append_proc dict_aa "t2388" "瀬戸" 25476 "1995-1-9"
	in let _ = dict_append_proc dict_aa "t2389" "犬山" 47821 "1995-10-5"
	in
		dict_aa
(* ------------------------------------------------------------------- *)
let _ = print_endline "*** 開始 ***"

let dict_aa = data_prepare_proc ()

let _ = let text_file = Sys.argv.(1)
	in
	printf "%s\n" text_file;
	text_write_proc text_file dict_aa

let _ = print_endline "*** 終了 ***"

(* ------------------------------------------------------------------- *)
