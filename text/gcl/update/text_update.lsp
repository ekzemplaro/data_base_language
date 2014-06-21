#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	text_update.lsp
;
;						Oct/02/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_in (nth 1 si::*command-args*))
(setf id_in (nth 2 si::*command-args*))
(setf population_in (parse-integer (nth 3 si::*command-args*)))
(format t "~a~%" file_in)
(format t "~a ~a~%" id_in population_in)
;
(setf dict_aa (text_read_proc file_in))
;
(setf dict_aa (dict_update_proc dict_aa id_in population_in))
;
(dict_display_proc dict_aa)
;
(text_write_proc file_in dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
