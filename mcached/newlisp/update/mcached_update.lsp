#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_update.lsp
;
;					Feb/10/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
;
(setf key_in (main-args 2))
(setf population_in (main-args 3))
;
(println key_in)
(println population_in)
;
(setf hostname "localhost") 
(setf port 11211) 
;
(mcached_update_proc hostname port key_in population_in)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
