; -------------------------------------------------------------------
;
;	text_read.lisp
;
;						Oct/02/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_in)
(defvar dict_aa)
(setf file_in (car *command-line-application-arguments*))

(format t "~a~%" file_in)
;
(setf dict_aa (text_read_proc file_in))
(dict_display_proc dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
