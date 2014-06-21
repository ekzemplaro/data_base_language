#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	exist_read.l
#
#					Oct/29/2010
#
#
# -------------------------------------------------------------
(load "@lib/http.l")
(prinl "*** 開始 ***")
(client "localhost" 8086 "exist/rest/cities/cities.xml"
	(out NIL (echo)))
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
