#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	text_read.scm
;;
;;					Jan/14/2014
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
;; (let ((port (current-output-port)))
;;            (set-port-encoding! port "utf-8"))
;;
(display "*** 開始 ***\n")
(define file-name (cadr (command-line)))

(define doc_aa (make-hash-table))

(text_read_proc file-name doc_aa)

(dict_display_proc doc_aa)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
