#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	csv_read.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_in (main-args 2))
(println file_in)
;
(new Tree 'dict_aa)
(csv_to_dict_proc file_in)
;
(dict_display_proc)
;
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
