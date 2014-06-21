#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	redis_read.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/redis_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t1851" "t1852" "t1853" "t1854" "t1855"
	"t1856" "t1857" "t1858" "t1859"))
;
(setf hostname "host_dbase") 
(setf port 6379) 
(set 'socket (net-connect hostname port))
;
(dolist (key keys)
	(redis_read_proc socket key))
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
