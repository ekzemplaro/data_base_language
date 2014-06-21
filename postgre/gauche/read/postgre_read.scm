#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	postgre_read.scm
;;
;;					Feb/25/2011
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(print "*** 開始 ***")
(define connection (dbi-connect "dbi:pg:dbname=city;host=localhost"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(define result-set (dbi-execute-query query "select * from cities"))
(define rows
    (map (lambda (row) (string-join (list (dbi-get-value row 0)
		 (dbi-get-value row 1)
		 (dbi-get-value row 2)
		 (dbi-get-value row 3)) "\t")) result-set))
(for-each print rows)
;; (for-each print (dbi-do connection "select * from cities"))
(dbi-close connection)
(print "*** 終了 ***")

;; ----------------------------------------------------------------------
