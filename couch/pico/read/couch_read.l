#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	couch_read.l
#
#					Jan/20/2015
#
#
# -------------------------------------------------------------
(load "@lib/http.l")
(prinl "*** 開始 ***")
(client "localhost" 5984 "nagano/t2022"
	(out NIL (echo)))
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
