#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	neo4j_read.scm
;;
;;					Aug/30/2012
;;
;; ----------------------------------------------------------------------
(use rfc.http)
(use srfi-11)
(use text.json)
(use slib)
;; ----------------------------------------------------------------------
;; (load "/var/www/data_base/common/gauche_common/json_manipulate.scm")
;; ----------------------------------------------------------------------
(define (display_data_proc data_in)
	(format #t "~a\t" data_in)
	)
;; ----------------------------------------------------------------------
(define (neo4j_display_proc key)
	(let-values (((status header body)
		(http-get "localhost:7474" (string-append
			 "/db/data/node/" key "/properties")
		)))
;;	(format #t "~s\n~s\n~s\n" status header body)
;;		(format #t "~s\n" body)
		(display_data_proc (cdr (ref (json-read body) 0)))
		(display_data_proc (cdr (ref (json-read body) 2)))
		(display_data_proc (cdr (ref (json-read body) 3)))
		(display_data_proc (cdr (ref (json-read body) 1)))
		(newline)
	)
)

;; ----------------------------------------------------------------------
(define (main args)
(print "*** 開始 ***")
;;
(neo4j_display_proc "1")
(neo4j_display_proc "2")
(neo4j_display_proc "3")
(neo4j_display_proc "4")
(neo4j_display_proc "5")
(neo4j_display_proc "6")
(neo4j_display_proc "7")
(neo4j_display_proc "8")
(neo4j_display_proc "9")
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
