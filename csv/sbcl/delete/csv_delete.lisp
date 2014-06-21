#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	csv_delete.lsp
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
(setf dict_aa (csv_read_proc file_in))
;
(remhash id_in dict_aa)
;
(dict_display_proc dict_aa)
;
(csv_write_proc file_in dict_aa)
;
(print "*** 終了 ***")
; -------------------------------------------------------------------
