#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	csv_create.scm
;;
;;						Jul/02/2012
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
(define dict_aa (make-hash-table 'string=?))
(dict_append_proc dict_aa "t1271" "千葉" 23157 "1971-5-12")
(dict_append_proc dict_aa "t1272" "勝浦" 98356 "1971-7-8")
(dict_append_proc dict_aa "t1273" "市原" 72873 "1971-9-11")
(dict_append_proc dict_aa "t1274" "流山" 43595 "1971-3-12")
(dict_append_proc dict_aa "t1275" "八千代" 72189 "1971-10-8")
(dict_append_proc dict_aa "t1276" "我孫子" 35423 "1971-11-29")
(dict_append_proc dict_aa "t1277" "鴨川" 15485 "1971-9-17")
(dict_append_proc dict_aa "t1278" "銚子" 85476 "1971-1-12")
(dict_append_proc dict_aa "t1279" "市川" 35462 "1971-10-19")
dict_aa)
;; ----------------------------------------------------------------------
(define (main args)
(define file_out (car (cdr args)))
(define dict_aa (data_prepare_proc))
(print "*** 開始 ***")
;;
;;
(dict_display_proc dict_aa)
;;
(csv_write_proc file_out dict_aa)
;;
(print "*** 終了 ***")
0
)

;; ----------------------------------------------------------------------
