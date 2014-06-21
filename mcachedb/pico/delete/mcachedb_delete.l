#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	mcachedb_delete.l
#
#					Jan/24/2014
#
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq key_in (car (argv)))
(prinl key_in)
(setq port 21201)
(when (connect "localhost" port)
	(out @ (prinl (pack "delete " key_in)))
	(in @ (prinl (read)))
	(close @) )
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
