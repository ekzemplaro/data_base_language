; -------------------------------------------------------------------
;
;	csv_update.lisp
;
;						Oct/04/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(defvar file_in)
(defvar id_in)
(defvar population_in)
(defvar dict_aa)
(format t "*** 開始 ***~%")
(setf file_in (car *command-line-application-arguments*))
(setf id_in (cadr *command-line-application-arguments*))
(setf population_in (parse-integer (caddr *command-line-application-arguments*)))
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
