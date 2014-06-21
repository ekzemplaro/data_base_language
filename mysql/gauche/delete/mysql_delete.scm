#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mysql_delete.scm
;;
;;					Nov/16/2010
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define (main args)
(define id_in (cadr args))
(define connection (dbi-connect "dbi:mysql:db=city;host=host_mysql"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(print "*** 開始 ***")
(print id_in)
(dbi-do connection "set NAMES utf8")
(let* ((query (dbi-prepare connection
	"delete from cities where ID= ?")))
(dbi-execute query id_in))
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
