#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	sqlite3_read.scm
;;
;;					Sep/30/2010
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(print "*** 開始 ***")
(define connection
   (dbi-connect "dbi:sqlite3:/var/tmp/sqlite3/cities.db"))
;;
(for-each
   (lambda
	(row)
	(format (current-output-port) "~a\t~a\t~a\t~a\n"
	(dbi-get-value row 0)
	(dbi-get-value row 1)
	(dbi-get-value row 2)
	(dbi-get-value row 3)))
	(dbi-execute
	(dbi-prepare connection "SELECT * FROM cities;")
	))
(dbi-close connection)
(print "*** 終了 ***")
;; ----------------------------------------------------------------------
