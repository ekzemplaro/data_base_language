#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	csv_read.lisp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_in)
(setf file_in (cadr *posix-argv*))

(format t "~a~%" file_in)
;
(defvar dict_aa)
(setf dict_aa (csv_read_proc file_in))
(dict_display_proc dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
