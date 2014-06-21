#! /usr/local/bin/rebol 
;
;	text_read.r
;
;				Jun/09/2011
; ------------------------------------------------------------------
REBOL [
Title:  "Text Read"
Author: "Uchida Masatomo"
]


print "*** 開始 ***"
;
file_in: system/script/args
print file_in
;
#url_in: file:///var/tmp/plain_text/cities.txt
url_in: file:/var/tmp/plain_text/cities.txt
#url_in: file_in
;
; lines: read file_in
lines: read url_in
print lines
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
