; -------------------------------------------------------------------
;
;	csv_read.cl
;
;						Feb/25/2011
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")

; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setq file_in (cadr (system:command-line-arguments)))

(format t "~a~%" file_in)
;
(setf *hh* (csv_read_proc file_in))
(dict_display_proc *hh* )
;
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
