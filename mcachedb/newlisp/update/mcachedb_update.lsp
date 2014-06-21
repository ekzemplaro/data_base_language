#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcachedb_update.lsp
;
;					Jan/27/2014
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
(setf port 21201) 
(set 'socket (net-connect hostname port))
;
(mcached_read_proc socket key_in)
(mcached_update_proc socket key_in population_in)
;
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
