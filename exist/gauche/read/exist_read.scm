#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	exist_read.scm
;;
;;					Oct/04/2010
;;
;; ----------------------------------------------------------------------
(use rfc.http)
(use srfi-11)
(define (main args)
(print "*** 開始 ***")
(let-values (((status header body)
	(http-get "localhost:8086" "/exist/rest/cities/cities.xml")))
	(format #t "~s\n~s\n~s\n" status header body))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
