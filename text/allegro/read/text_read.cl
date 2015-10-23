; -------------------------------------------------------------------
;
;	text_read.cl
;
;						Oct/11/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
;(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_in (cadr (system:command-line-arguments)))

(format t "~a~%" file_in)
;
(setf *hh* (text_read_proc file_in))
(dict_display_proc *hh* )
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
