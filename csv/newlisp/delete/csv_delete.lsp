#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	csv_delete.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_txt (main-args 2))
(setf key_in (main-args 3))
(println file_txt)
(println key_in)
;
(new Tree 'dict_aa)
(csv_to_dict_proc file_txt)
;
(dict_aa key_in nil)
;
(dict_display_proc)
;
(csv_write_proc file_txt)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
