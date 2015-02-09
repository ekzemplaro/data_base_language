#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	redis_delete.l
#
#					Jan/20/2015
#
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq key_in (car (argv)))
(prinl key_in)
(when (connect "host_dbase" 6379)
	(prinl "*** aaa ***")
	(out @ (prinl (pack "del " key_in "^M")))
	(in @ (prinl (read)))
	(prinl "*** bbb ***")
	(close @)
	(prinl "*** ppp ***")
)
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
