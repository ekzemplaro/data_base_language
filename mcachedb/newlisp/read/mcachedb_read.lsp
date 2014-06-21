#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcachedb_read.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t1521" "t1522" "t1523" "t1524" "t1525"
	"t1526" "t1527" "t1528" "t1529"
	"t1530" "t1531" "t1532"))
;
(setf hostname "localhost") 
(setf port 21201) 
(set 'socket (net-connect hostname port))
;
(dolist (key keys)
	(mcached_read_proc socket key))
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
