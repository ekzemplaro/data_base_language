#! /usr/local/bin/rebol 
;
;	json_create.r
;
;				Sep/25/2011
; ------------------------------------------------------------------
REBOL [
Title:  "Json Create"
Author: "Uchida Masatomo"
]

; ------------------------------------------------------------------
tag_gen_proc: func [tag value][
	rejoin ["^"" tag "^": ^"" value "^"" ]
]
;
; ------------------------------------------------------------------
gen_string: func [id name population date_mod delimit][
;
	bb: tag_gen_proc "name" name
	cc: tag_gen_proc "population" population
	dd: tag_gen_proc "date_mod" date_mod
	rejoin ["^"" id  "^": {" bb "," cc "," dd "}" delimit]
;
]
; ------------------------------------------------------------------
print "*** 開始 ***"
;
file_out: %/var/tmp/json/cities.json
;
write/lines file_out "{"
write/append/lines file_out gen_string "t0921" "宇都宮" "42379" "1966-10-5" ","
write/append/lines file_out gen_string "t0922" "小山" "53723" "1966-5-18" ","
write/append/lines file_out gen_string "t0923" "佐野" "37814" "1966-9-22" ","
write/append/lines file_out gen_string "t0924" "足利" "61842" "1966-9-9" ","
write/append/lines file_out gen_string "t0925" "日光" "42351" "1966-8-4" ","
write/append/lines file_out gen_string "t0926" "下野" "35187" "1966-1-21" ","
write/append/lines file_out gen_string "t0927" "さくら" "81256" "1966-7-23" ","
write/append/lines file_out gen_string "t0928" "矢板" "24784" "1966-10-26" ","
write/append/lines file_out gen_string "t0929" "真岡" "75823" "1966-12-15" ","
write/append/lines file_out gen_string "t0930" "栃木" "23412" "1966-11-21" ","
write/append/lines file_out gen_string "t0931" "大田原" "17854" "1966-8-9" ","
write/append/lines file_out gen_string "t0932" "鹿沼" "56792" "1966-5-4" ","
write/append/lines file_out gen_string "t0933" "那須塩原" "39247" "1966-7-12" ","
write/append/lines file_out gen_string "t0934" "那須烏山" "82531" "1966-9-21" "}"

print "*** 終了 ***"
quit

; ------------------------------------------------------------------
