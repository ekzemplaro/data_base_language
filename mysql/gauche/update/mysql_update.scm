#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mysql_update.scm
;;
;;					Nov/16/2010
;;
;; ----------------------------------------------------------------------
(use dbi)
(use srfi-19)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define (main args)
(define id_in (cadr args))
(define population_in (caddr args))
(define date_mod (date->string (current-date) "~Y-~m-~d"))
(define connection (dbi-connect "dbi:mysql:db=city;host=host_mysql"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(print "*** 開始 ***")
(display id_in)
(display "\t")
(display population_in)
(display "\t")
(print date_mod)
(dbi-do connection "set NAMES utf8")
(let* ((query (dbi-prepare connection
	"update cities set population= ? , date_mod= ? where ID= ?")))
  (dbi-execute query population_in date_mod id_in))
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
