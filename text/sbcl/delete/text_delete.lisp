#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	text_delete.lsp
;
;						Jan/08/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/common_lisp/text_manipulate.lisp")
; -------------------------------------------------------------------
(print "*** 開始 ***")
(defvar file_in)
(defvar id_in)
(defvar dict_aa)
;
(setq file_in (cadr *posix-argv*))
(setq id_in (caddr *posix-argv*))
(format t "~a~%" file_in)
(format t "~a~%" id_in)
;
(setf dict_aa (text_read_proc file_in))
;

(defvar unit_aa)
(defvar s0)
(defvar s1)
(defvar s2)
;(setf unit_aa (gethash (parse-integer id_in) dict_aa))
(setf unit_aa (gethash id_in dict_aa))
(format t "~s~%" unit_aa)
(setf s0 (gethash 'name unit_aa))
	(setf s1 (gethash 'population unit_aa))
	(setf s2 (gethash 'date_mod unit_aa))
(format t "~a	~a	~a~%" s0 s1 s2)
;
;
;(remhash (parse-integer id_in) dict_aa)
(remhash id_in dict_aa)
;
(dict_display_proc dict_aa)
;
(text_write_proc file_in dict_aa)
;
(print "*** 終了 ***")
; -------------------------------------------------------------------
