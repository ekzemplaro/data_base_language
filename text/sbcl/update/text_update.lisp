#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	text_update.lisp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar file_in)
(defvar id_in)
(defvar population_in)
(defvar dict_aa)
;
(setf file_in (cadr *posix-argv*))

(setf id_in (caddr *posix-argv*))

(setf population_in (cadddr *posix-argv*))

(format t "~a~%" file_in)
(format t "~a ~a~%" id_in population_in)
;
(setf dict_aa (text_read_proc file_in))
;
;(setf dict_aa (dict_update_proc dict_aa (parse-integer id_in) population_in))
(setf dict_aa (dict_update_proc dict_aa id_in population_in))

(dict_display_proc dict_aa)
;
(text_write_proc file_in dict_aa)
(format t "*** 終了 ***~%")

; -------------------------------------------------------------------
