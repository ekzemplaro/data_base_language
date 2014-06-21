#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mysql_create.scm
;;
;;					Jun/24/2011
;;
;; ----------------------------------------------------------------------
(use dbi)
(use srfi-19)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define sql_insert_proc  (lambda (connection str_value)
	(define sql_str (string-join 
		(list "insert into cities values" str_value) " "))
	(dbi-do connection sql_str)
	))
;; ----------------------------------------------------------------------
(define (main args)
(define connection (dbi-connect "dbi:mysql:db=city;host=host_mysql"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(define str_drop "drop table cities")
(define str_create "create table cities (id varchar(10) primary key, name text, population int, date_mod date)")
(print "*** 開始 ***")
(dbi-do connection "set NAMES utf8")
(dbi-do connection str_drop)
(dbi-do connection str_create)
(sql_insert_proc connection "('t3321','岡山',71536,'1971-9-21')")
(sql_insert_proc connection "('t3322','倉敷',54684,'1971-8-15')")
(sql_insert_proc connection "('t3323','津山',63213,'1971-6-19')")
(sql_insert_proc connection "('t3324','玉野',79287,'1971-4-29')")
(sql_insert_proc connection "('t3325','笠岡',35619,'1971-7-8')")
(sql_insert_proc connection "('t3326','井原',48314,'1971-9-21')")
(sql_insert_proc connection "('t3327','総社',87152,'1971-8-14')")
(sql_insert_proc connection "('t3328','高梁',27531,'1971-7-26')")
(sql_insert_proc connection "('t3329','新見',32597,'1971-11-7')")
;;
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
