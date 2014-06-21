#! /usr/local/bin/rebol 
;
;	text_create.r
;
;				Jun/09/2011
; ------------------------------------------------------------------
REBOL [
Title:  "Text Create"
Author: "Uchida Masatomo"
]

; ------------------------------------------------------------------
gen_string_proc: func [id name population date_mod][
;
	rejoin [id "^(tab)" name "^(tab)" population "^(tab)" date_mod]
;
]
; ------------------------------------------------------------------
print "*** 開始 ***"
;
file_out: %/var/tmp/plain_text/cities.txt
;file_out: %cities.txt
;
write/lines file_out gen_string_proc "t2381" "名古屋" "48537" "1966-4-21"
write/append/lines file_out gen_string_proc "t2382" "豊橋" "53723" "1966-5-15"
write/append/lines file_out gen_string_proc "t2383" "岡崎" "37814" "1966-9-22"
write/append/lines file_out gen_string_proc "t2384" "一宮" "69361" "1966-9-9"
write/append/lines file_out gen_string_proc "t2385" "蒲郡" "42374" "1966-8-4"
write/append/lines file_out gen_string_proc "t2386" "常滑" "35187" "1966-1-21"
write/append/lines file_out gen_string_proc "t2387" "大府" "81256" "1966-7-23"
write/append/lines file_out gen_string_proc "t2388" "瀬戸" "24784" "1966-10-26"
write/append/lines file_out gen_string_proc "t2389" "犬山" "72346" "1966-12-15"
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
