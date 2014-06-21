#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	webdav_read.l
#
#					Mar/29/2012
#
#
# -------------------------------------------------------------
(load "@lib/http.l")
(prinl "*** 開始 ***")
(client "host_dbase" 3004 "city/tokyo.json"
	(out NIL (echo)))
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
