#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	postgre_create.scm
;;
;;					Sep/30/2010
;;
;; ----------------------------------------------------------------------
(use dbi)
(use srfi-19)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define sql_insert_proc  (lambda (connection str_value)
	(define sql_str (string-join 
		(list "insert into cities values" str_value) " "))
	(let* ((query (dbi-prepare connection sql_str)))
	(dbi-execute query))
	))
;; ----------------------------------------------------------------------
(define sql_execute_proc  (lambda (connection sql_str)
	(define query (dbi-make-query connection))
	(let* ((query (dbi-prepare connection sql_str)))
	(dbi-execute query))
	))
;; ----------------------------------------------------------------------
(define (main args)
(define connection (dbi-connect "dbi:pg:dbname=city;host=localhost"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(define str_drop "drop table cities")
(define str_create "create table cities (id int primary key, name text, population int, date_mod date)")
(print "*** 開始 ***")
(sql_execute_proc connection str_drop)
(sql_execute_proc connection str_create)
(sql_insert_proc connection "(3461,'広島',371100,'1992-9-27')")
(sql_insert_proc connection "(3462,'福山',251080,'1992-8-15')")
(sql_insert_proc connection "(3463,'東広島',53113,'1992-6-19')")
(sql_insert_proc connection "(3464,'呉',97207,'1992-4-29')")
(sql_insert_proc connection "(3465,'尾道',35019,'1992-7-8')")
(sql_insert_proc connection "(3466,'竹原',48314,'1992-9-21')")
(sql_insert_proc connection "(3467,'三次',87152,'1992-8-14')")
(sql_insert_proc connection "(3468,'大竹',275110,'1992-7-26')")
(sql_insert_proc connection "(3469,'府中',365250,'1992-11-7')")
;;
;; (let* ((query (dbi-prepare connection
;;	"update cities set population= ? , date_mod= ? where ID= ?")))
;;  (dbi-execute query population_in date_mod id_in))
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
