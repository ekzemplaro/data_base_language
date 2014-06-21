#! /usr/bin/clisp
; -------------------------------------------------------------------
;
;	text_read.lsp
;
;						Oct/16/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_in)
(setf file_in (car *args*))

(format t "~a~%" file_in)
;
(setf dict_aa (text_read_proc file_in))
(dict_display_proc dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
