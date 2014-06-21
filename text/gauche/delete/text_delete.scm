#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	text_delete.scm
;;
;;					Mar/02/2011
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (main args)
(define file_txt (cadr args))
(define id_in (caddr args))
(define dict_aa (make-hash-table 'string=?))
;;
(display "*** 開始 ***\n")
(display id_in)
(display "\n")
;;
(text_read_proc file_txt dict_aa)
(hash-table-delete! dict_aa id_in)
(dict_display_proc dict_aa)
(text_write_proc file_txt dict_aa)
(display "*** 終了 ***\n")
0
)

;; ----------------------------------------------------------------------

