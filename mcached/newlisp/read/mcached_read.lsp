#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_read.lsp
;
;					Feb/10/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t1731" "t1732" "t1733" "t1734" "t1735"
	"t1736" "t1737" "t1738" "t1739"))
;
(setf hostname "localhost") 
(setf port 11211)

(mcached_display_proc hostname port keys)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
