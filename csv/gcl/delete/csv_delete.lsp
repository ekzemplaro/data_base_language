#! /usr/bin/gcl -f
; -------------------------------------------------------------------
;
;	csv_delete.lsp
;
;						Oct/04/2013
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
(setf dict_aa (csv_read_proc file_in))
;
(remhash id_in dict_aa)
;
(csv_write_proc file_in dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
