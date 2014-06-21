#! /usr/local/bin/rebol 
;
;	couch_read.r
;
;				Feb/16/2011
; ------------------------------------------------------------------
REBOL [
Title:  "couch read"
Author: "Uchida Masatomo"
]
print "*** 開始 ***"

url_in: http://host_couch:5984/city/cities
print read url_in
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
