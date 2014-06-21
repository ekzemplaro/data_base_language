; -------------------------------------------------------------------
;
;	csv_read.lisp
;
;					Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_in (nth 6 (si:command-args)))

(format t "~a~%" file_in)
;
(setf dict_aa (csv_read_proc file_in))
(dict_display_proc dict_aa)
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
