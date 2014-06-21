#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	gdbm_create.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use dbm.gdbm)
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/gauche_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
(define dict_aa (make-hash-table 'string=?))
(dict_append_proc dict_aa "t2151" "岐阜" 75942 "1971-11-15")
(dict_append_proc dict_aa "t2152" "大垣" 81936 "1971-7-29")
(dict_append_proc dict_aa "t2153" "多治見" 23764 "1971-8-11")
(dict_append_proc dict_aa "t2154" "各務原" 42597 "1971-5-12")
(dict_append_proc dict_aa "t2155" "土岐" 72319 "1971-6-8")
(dict_append_proc dict_aa "t2156" "高山" 35298 "1971-3-29")
(dict_append_proc dict_aa "t2157" "美濃加茂" 75815 "1971-9-17")
(dict_append_proc dict_aa "t2158" "恵那" 85176 "1971-1-12")
(dict_append_proc dict_aa "t2159" "関" 25631 "1971-8-19")
(dict_append_proc dict_aa "t2160" "中津川" 38927 "1971-5-4")
dict_aa)
;; ----------------------------------------------------------------------
(define (main args)
(define dict_aa (data_prepare_proc))
(define file_gdbm (car (cdr args)))
(print "*** 開始 ***")
(let ((db (dbm-open <gdbm> :path file_gdbm :rw-mode :write)))

(hash-table-for-each dict_aa (lambda (key value)
		(define uu (hash-table-get dict_aa key))
		(define name (hash-table-get uu 'name))
		(define population
			(number->string (hash-table-get uu 'population)))
		(define date_mod (hash-table-get uu 'date_mod))
		(define str_json (string-append "{\"name\": \""  name
			 "\", \"population\": " population
			 ", \"date_mod\": \"" date_mod "\"}"))
		(display str_json)
		(display "\n")
		(dbm-put! db key str_json)
		))
(dbm-close db))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
