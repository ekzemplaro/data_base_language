#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	xindice_read.scm
;;
;;					Oct/04/2010
;;
;; ----------------------------------------------------------------------
(use rfc.http)
(use srfi-11)
(define (main args)
(print "*** 開始 ***")
(let-values (((status header body)
	(http-get "cdbd026:8888" "/xindice/db/cities/cities")))
	(format #t "~s\n~s\n~s\n" status header body))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
