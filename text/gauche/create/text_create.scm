#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	text_create.scm
;;
;;					Jul/11/2012
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
(define dict_aa (make-hash-table 'string=?))
(dict_append_proc dict_aa "t2381" "名古屋" 93187 "1971-2-18")
(dict_append_proc dict_aa "t2382" "豊橋" 78279 "1971-5-29")
(dict_append_proc dict_aa "t2383" "岡崎" 87264 "1971-8-11")
(dict_append_proc dict_aa "t2384" "一宮" 43591 "1971-6-12")
(dict_append_proc dict_aa "t2385" "蒲郡" 72319 "1971-9-8")
(dict_append_proc dict_aa "t2386" "常滑" 35293 "1971-3-9")
(dict_append_proc dict_aa "t2387" "大府" 17815 "1971-9-17")
(dict_append_proc dict_aa "t2388" "瀬戸" 84176 "1971-12-12")
(dict_append_proc dict_aa "t2389" "犬山" 25637 "1971-10-19")
dict_aa)
;; ----------------------------------------------------------------------
(define (main args)
(define file_out (car (cdr args)))
(define dict_aa (data_prepare_proc))
(print "*** 開始 ***")
;;
(dict_display_proc dict_aa)
;;
(text_write_proc file_out dict_aa)
;;
(print "*** 終了 ***")
0
)

;; ----------------------------------------------------------------------
