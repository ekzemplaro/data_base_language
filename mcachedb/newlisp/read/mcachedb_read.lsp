#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcachedb_read.lsp
;
;					Feb/10/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t1521" "t1522" "t1523" "t1524" "t1525"
	"t1526" "t1527" "t1528" "t1529"
	"t1530" "t1531" "t1532"))
;
(setf hostname "host_ubuntu1") 
(setf port 21201) 
;
(mcached_display_proc hostname port keys)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
