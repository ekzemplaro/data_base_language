#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	text_update.scm
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
(define population_in (cadddr (command-line)))

(display key_in)
(newline)
(display population_in)
(newline)

(define dict_aa (make-hash-table))

(text_read_proc file-name dict_aa)

(dict_update_proc dict_aa key_in population_in)

;; (dict_display_proc dict_aa)

(text_write_proc file-name dict_aa)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
