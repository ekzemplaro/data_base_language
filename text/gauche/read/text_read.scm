#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	text_read.scm
;;
;;					Feb/10/2011
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (main args)
(define file_in (car (cdr args)))
(define dict_aa (make-hash-table 'string=?))
(display "*** 開始 ***\n")
(text_read_proc file_in dict_aa)
(dict_display_proc dict_aa)
(display "*** 終了 ***\n")
0
)

;; ----------------------------------------------------------------------
