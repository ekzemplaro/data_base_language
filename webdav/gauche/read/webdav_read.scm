#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	webdav_read.scm
;;
;;					Dec/26/2013
;;
;; ----------------------------------------------------------------------
(use rfc.http)
(use srfi-11)
(use rfc.json)
(use slib)
;; ----------------------------------------------------------------------
(define (record_display rec_aa)
	(define key (car rec_aa))
	(define uu (cdr rec_aa))
	(define name (cdr (assoc "name" uu)))
;
	(define population (cdr (assoc "population" uu)))
;
	(define date_mod (cdr (assoc "date_mod" uu)))
;
	(define list_out (list key name (number->string population) date_mod))
	(define str_out (string-join list_out "\t"))
	(display str_out)
	(newline)
)
;; ----------------------------------------------------------------------
(define (main args)
(print "*** 開始 ***")
(let-values (((status header body)
	(http-get "host_dbase:3004" "/city/tokyo.json")))
;;	(format #t "~s\n~s\n~s\n" status header body)
	(map (lambda (dd) (record_display dd)) (parse-json-string body))
	)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
