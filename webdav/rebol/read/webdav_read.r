#! /usr/local/bin/rebol 
;
;	webdav_read.r
;
;				Mar/30/2012
; ------------------------------------------------------------------
REBOL [
Title:  "couch read"
Author: "Uchida Masatomo"
]
print "*** 開始 ***"

url_in: http://host_dbase:3004/city/tokyo.json
print read url_in
print "*** 終了 ***"
quit

; ------------------------------------------------------------------
