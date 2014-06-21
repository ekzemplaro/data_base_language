#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	couch_read.l
#
#					Oct/28/2010
#
#
# -------------------------------------------------------------
(load "@lib/http.l")
(prinl "*** 開始 ***")
(client "host_couch" 5984 "city/cities"
	(out NIL (echo)))
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
