#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	text_delete.lsp
;
;						Oct/02/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_in (nth 1 si::*command-args*))

(setq id_in (nth 2 si::*command-args*))

(format t "~a~%" file_in)
(format t "~a~%" id_in)
;
(setf dict_aa (text_read_proc file_in))
;
(remhash id_in dict_aa)
;
(text_write_proc file_in dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
