#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mysql_read.scm
;;
;;					Jan/06/2011
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(print "*** 開始 ***")
(define connection (dbi-connect "dbi:mysql:db=city;host=host_mysql"
	 :username "scott" :password "tiger"))
(dbi-do connection "set NAMES utf8")
(define query (dbi-make-query connection))
(define result-set (dbi-execute-query query "select * from cities"))
(define rows
    (map (lambda (row) (string-join (list (dbi-get-value row 0)
		 (dbi-get-value row 1)
		 (dbi-get-value row 2)
		 (dbi-get-value row 3)) "\t")) result-set))
(for-each print rows)
(dbi-close connection)
(print "*** 終了 ***")
;; ----------------------------------------------------------------------
