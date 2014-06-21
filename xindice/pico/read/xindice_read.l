#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	xindice_read.l
#
#					Oct/29/2010
#
#
# -------------------------------------------------------------
(load "@lib/http.l")
(prinl "*** 開始 ***")
(client "cdbd026" 8888 "xindice/db/cities/cities"
	(out NIL (echo)))
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
