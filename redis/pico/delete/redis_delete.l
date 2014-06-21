#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	redis_delete.l
#
#					Jan/24/2014
#
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq key_in (car (argv)))
(prinl key_in)
(when (connect "host_dbase" 6379)
	(out @ (prinl (pack "del " key_in "^M")))
	(in @ (prinl (read)))
	(close @) )
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
