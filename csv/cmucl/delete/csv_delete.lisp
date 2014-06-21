; -------------------------------------------------------------------
;
;	csv_delete.lisp
;
;						Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_in)
(defvar id_in)
(defvar dict_aa)
(setq file_in (car *command-line-application-arguments*))
(setq id_in (cadr *command-line-application-arguments*))
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
