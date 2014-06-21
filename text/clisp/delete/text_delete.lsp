#! /usr/bin/clisp
; -------------------------------------------------------------------
;
;	text_delete.lsp
;
;						Oct/17/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_in (car *args*))
(setq key_in (cadr *args*))
(format t "~a~%" file_in)
(format t "~a~%" key_in)
;
(setf dict_aa (text_read_proc file_in))
;
(remhash key_in dict_aa)
;
(text_write_proc file_in dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
