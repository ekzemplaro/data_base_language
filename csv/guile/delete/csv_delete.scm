#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	csv_delete.scm
;;
;;					Feb/28/2011
;;
;; ----------------------------------------------------------------------
(use-modules (srfi srfi-1)
                  (srfi srfi-13))
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(display "*** 開始 ***\n")
(define file-name (cadr (command-line)))
(define id_in (caddr (command-line)))

(display id_in)
(newline)

(define doc_aa (make-hash-table))

(csv_read_proc file-name doc_aa)

(hashq-remove! doc_aa (string->symbol id_in))

(dict_display_proc doc_aa)

(csv_write_proc file-name doc_aa)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
