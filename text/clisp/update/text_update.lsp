#! /usr/bin/clisp
; -------------------------------------------------------------------
;
;	text_update.lsp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_in (car *args*))
(setf key_in (cadr *args*))
(setf population_in (parse-integer (caddr *args*)))
(format t "~a~%" file_in)
(format t "~a ~a~%" key_in population_in)
;
(setf dict_aa (text_read_proc file_in))
;
(setf dict_aa (dict_update_proc dict_aa key_in population_in))
;
(text_write_proc file_in dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
