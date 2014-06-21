#! /usr/local/bin/rebol 
;
;	xindice_read.r
;
;				Feb/17/2011
; ------------------------------------------------------------------
REBOL [
Title:  "xindice read"
Author: "Uchida Masatomo"
]
print "*** 開始 ***"

url_in: http://host_xindice:8888/xindice/db/cities/cities
print read url_in
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
