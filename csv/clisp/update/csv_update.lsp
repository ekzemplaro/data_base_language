; -------------------------------------------------------------------
;
;	csv_update.lsp
;
;						Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(setf file_in (car *args*))
(setf id_in (cadr *args*))
(setf population_in (parse-integer (caddr *args*)))
(format t "~a~%" file_in)
(format t "~a ~a~%" id_in population_in)
;
(setf dict_aa (csv_read_proc file_in))
;
(setf dict_aa (dict_update_proc dict_aa id_in population_in))

;
(csv_write_proc file_in dict_aa)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
