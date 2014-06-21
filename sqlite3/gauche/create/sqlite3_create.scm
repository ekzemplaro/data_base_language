#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	sqlite3_create.scm
;;
;;					Jul/05/2011
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define sql_insert_proc  (lambda (connection str_value)
	(define sql_str (string-join 
		(list "insert into cities values" str_value) " "))
	(dbi-do connection sql_str)
	))
;; ----------------------------------------------------------------------
(define (main args)
(define connection (dbi-connect "dbi:sqlite3:/var/tmp/sqlite3/cities.db"))
(define query (dbi-make-query connection))
(define str_drop "drop table cities")
(define str_create "create table cities (id varchar(10) primary key, name text, population int, date_mod date)")
(print "*** 開始 ***")
(dbi-do connection str_drop)
(dbi-do connection str_create)
(sql_insert_proc connection "('t0711','郡山',41527,'1972-11-21')")
(sql_insert_proc connection "('t0712','会津若松',21854,'1972-8-15')")
(sql_insert_proc connection "('t0713','白河',37163,'1972-6-19')")
(sql_insert_proc connection "('t0714','福島',74287,'1972-4-29')")
(sql_insert_proc connection "('t0715','喜多方',35619,'1972-7-8')")
(sql_insert_proc connection "('t0716','二本松',48314,'1972-9-21')")
(sql_insert_proc connection "('t0717','いわき',87152,'1972-8-14')")
(sql_insert_proc connection "('t0718','相馬',27519,'1972-7-26')")
(sql_insert_proc connection "('t0719','須賀川',32587,'1972-11-7')")
;;
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
