; -------------------------------------------------------------------
;
;	text_update.cl
;
;						Aug/06/2011
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")

(setf file_in (cadr (system:command-line-arguments)))
(setf id_in (caddr (system:command-line-arguments)))
(setf population_in (parse-integer (cadddr (system:command-line-arguments))))
(format t "~a~%" file_in)
(format t "~a ~a~%" id_in population_in)
;
(setf dict_aa (text_read_proc file_in))
;
(setf dict_aa (dict_update_proc dict_aa id_in population_in))

(dict_display_proc dict_aa)
;
(text_write_proc file_in dict_aa)
;
(format t "*** 終了 ***~%")

; -------------------------------------------------------------------
