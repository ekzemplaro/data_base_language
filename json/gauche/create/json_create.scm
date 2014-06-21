#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	text_create.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use	rfc.json)
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
(define dict_aa (make-hash-table 'string=?))
(dict_append_proc dict_aa "t0921" "宇都宮" 42593 "1971-7-15")
(dict_append_proc dict_aa "t0922" "小山" 68134 "1971-5-29")
(dict_append_proc dict_aa "t0923" "佐野" 39515 "1971-7-17")
(dict_append_proc dict_aa "t0924" "足利" 75947 "1971-8-5")
(dict_append_proc dict_aa "t0925" "日光" 95128 "1971-9-9")
(dict_append_proc dict_aa "t0926" "下野" 85217 "1971-1-27")
(dict_append_proc dict_aa "t0927" "さくら" 25746 "1971-4-14")
(dict_append_proc dict_aa "t0928" "矢板" 75618 "1971-3-11")
(dict_append_proc dict_aa "t0929" "真岡" 51293 "1971-2-25")
(dict_append_proc dict_aa "t0930" "栃木" 91476 "1971-5-21")
(dict_append_proc dict_aa "t0931" "大田原" 81527 "1971-7-17")
(dict_append_proc dict_aa "t0932" "鹿沼" 71453 "1971-9-19")
(dict_append_proc dict_aa "t0933" "那須塩原" 86124 "1971-12-8")
(dict_append_proc dict_aa "t0934" "那須烏山" 15392 "1971-10-17")
dict_aa)
;; ----------------------------------------------------------------------
(define (disp_proc output-port id_in name population date_mod delimiter)
	(display "\"" output-port)
	(display id_in output-port)
	(display "\": {\"name\":\"" output-port)
	(display name output-port)
	(display "\", \"population\":" output-port)
	(display (number->string population) output-port)
	(display ", \"date_mod\":\"" output-port)
	(display date_mod output-port)
	(display "\"}" output-port)
	(display delimiter output-port)
	(display "\n" output-port)
	) 
;; ----------------------------------------------------------------------
(define (proc01 output-port dict_aa)
	(hash-table-for-each dict_aa (lambda (key value)
		(define uu (hash-table-get dict_aa key))
		(define name (hash-table-get value 'name))
		(define population (hash-table-get value 'population))
		(define date_mod (hash-table-get value 'date_mod))
		(display key)
		(display name)
		(display "\n")
		(disp_proc output-port key name population date_mod ",")
		))
)

;; ----------------------------------------------------------------------
(define (main args)
(define file_out (car (cdr args)))
;(define output-port (open-output-file file_out))
(define dict_aa (data_prepare_proc))
(define alist_aa (hash-table->alist dict_aa))
(define data_aa (list "aa" "bb" "cc"))
(display "*** 開始 ***\n")

;; (json-write dict_aa (output (output-port)))
;(construct-json (hash-table->alist dict_aa) output-port)
(display alist_aa)
;
(construct-json-string data_aa)
;(proc01 output-port dict_aa)

;(close-output-port output-port)
(display "*** 終了 ***\n")
0
)
;; ----------------------------------------------------------------------
