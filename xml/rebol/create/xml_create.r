#! /usr/local/bin/rebol 
;
;	xml_create.r
;
;				Sep/25/2011
; ------------------------------------------------------------------
REBOL [
Title:  "Xml Create"
Author: "Uchida Masatomo"
]

; ------------------------------------------------------------------
tag_gen_proc: func [tag value][
	rejoin ["<" tag ">" value "</" tag ">"]
]
;
; ------------------------------------------------------------------
gen_string_proc: func [id name population date_mod][
;
	bb: tag_gen_proc "name" name
	cc: tag_gen_proc "population" population
	dd: tag_gen_proc "date_mod" date_mod
	rejoin ["<" id ">" bb cc dd "</" id ">"]
;
]
; ------------------------------------------------------------------
print "*** 開始 ***"
;
file_out: %/var/tmp/xml_file/cities.xml
;file_out: %cities.xml
;
write/lines file_out "<?xml version=^"1.0^" encoding=^"utf-8^"?>"
write/append/lines file_out "<root>"
write/append/lines file_out gen_string_proc "t2261" "静岡" "42537" "1966-7-15"
write/append/lines file_out gen_string_proc "t2262" "浜松" "53723" "1966-5-25"
write/append/lines file_out gen_string_proc "t2263" "沼津" "37814" "1966-3-22"
write/append/lines file_out gen_string_proc "t2264" "三島" "61892" "1966-9-9"
write/append/lines file_out gen_string_proc "t2265" "富士" "42351" "1966-8-4"
write/append/lines file_out gen_string_proc "t2266" "熱海" "35187" "1966-1-21"
write/append/lines file_out gen_string_proc "t2267" "富士宮" "81256" "1966-7-23"
write/append/lines file_out gen_string_proc "t2268" "藤枝" "24784" "1966-10-26"
write/append/lines file_out gen_string_proc "t2269" "御殿場" "75823" "1966-12-15"
write/append/lines file_out gen_string_proc "t2270" "島田" "23419" "1966-11-21"
write/append/lines file_out "</root>"
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
