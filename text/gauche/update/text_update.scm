#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;;
;;	text_update.scm
;;
;;					Mar/02/2011
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")

;; ----------------------------------------------------------------------
(define (main args)
(define file_txt (cadr args))
(define id_in (caddr args))
(define population_in (cadddr args))
(define dict_aa (make-hash-table 'string=?))
;;
(format #t "~a\t~a\n" id_in population_in)
;;
(display "*** 開始 ***\n")
(text_read_proc file_txt dict_aa)
(if (hash-table-exists? dict_aa id_in)
	(dict_update_proc dict_aa id_in population_in))
(dict_display_proc dict_aa)
(text_write_proc file_txt dict_aa)

(display "*** 終了 ***\n")
0
)

;; ----------------------------------------------------------------------

