#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	text_update.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_txt (main-args 2))
(setf key_in (main-args 3))
(setf population_in (main-args 4))
(println file_txt)
(println key_in)
(println population_in)
;
(new Tree 'dict_aa)
(text_to_dict_proc file_txt)
;
(dict_update_proc population_in)
(dict_display_proc)
;
(text_write_proc file_txt)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
