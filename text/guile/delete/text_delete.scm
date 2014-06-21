#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	text_delete.scm
;;
;;					Jan/14/2014
;;
;; ----------------------------------------------------------------------
(use-modules (srfi srfi-1)
                  (srfi srfi-13))
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))
(display "*** 開始 ***\n")
(define file-name (cadr (command-line)))
(define key_in (caddr (command-line)))

(display key_in)
(newline)

(define dict_aa (make-hash-table))

(text_read_proc file-name dict_aa)

(hashq-remove! dict_aa (string->symbol key_in))

(text_write_proc file-name dict_aa)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
