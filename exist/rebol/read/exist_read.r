#! /usr/local/bin/rebol 
;
;	exist_read.r
;
;				Feb/17/2011
; ------------------------------------------------------------------
REBOL [
Title:  "couch read"
Author: "Uchida Masatomo"
]
print "*** 開始 ***"

url_in: http://localhost:8086/exist/rest/cities/cities.xml
print read url_in
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
