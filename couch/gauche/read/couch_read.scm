#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	couch_read.scm
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
	(if (list? rec_aa)
		(begin
	(display (car rec_aa))
	(display "\t")
	(display (cdr (assoc "name" (cdr rec_aa))))
	(display "\t")
;
	(display (cdr (assoc "population" (cdr rec_aa))))
	(display "\t")
;
	(display (cdr (assoc "date_mod" (cdr rec_aa))))
;
	(newline)
		)
	)
)
;; ----------------------------------------------------------------------
(define (main args)
(print "*** 開始 ***")
(let-values (((status header body)
	(http-get "host_dbase:5984" "/city/cities")))
;	(format #t "~s\n~s\n~s\n" status header body)
	(map (lambda (dd) (record_display dd)) (parse-json-string body))
	)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
