#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_read.lsp
;
;					Jan/23/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t1731" "t1732" "t1733" "t1734" "t1735"
	"t1736" "t1737" "t1738" "t1739"))
;
(setf hostname "localhost") 
(setf port 11211) 
(set 'socket (net-connect hostname port))
;
(dolist (key keys)
	(mcached_read_proc socket key))
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
