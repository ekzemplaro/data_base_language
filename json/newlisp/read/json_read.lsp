#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	json_read.lsp
;
;						Jan/24/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/json_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_in (main-args 2))
(println file_in)
(setf str_json (read-file file_in))
(setf doc_aa (json-parse str_json))
(dict_display_proc doc_aa)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
