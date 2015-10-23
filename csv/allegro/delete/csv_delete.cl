; -------------------------------------------------------------------
;
;	csv_delete.cl
;
;						Aug/30/2011
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/allegro_common/text_manipulate.cl")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_in (cadr (system:command-line-arguments)))
(setf id_in (caddr (system:command-line-arguments)))
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
