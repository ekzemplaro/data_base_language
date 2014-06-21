#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	gdbm_updatete.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use dbm.gdbm)
(use rfc.json)
(use srfi-19)
;; ----------------------------------------------------------------------
(define (update_proc db key_in population_in)
	(define today (date->string (current-date) "~Y-~m-~d"))
	(define str_json (dbm-get db key_in))
	(define uu (parse-json-string str_json))
	(define name (cdr (assoc "name" uu)))
	(define str_json_new (string-append "{\"name\": \""  name
			 "\", \"population\": " population_in
			 ", \"date_mod\": \"" today "\"}"))
	(print str_json)
	(print str_json_new)
	(dbm-put! db key_in str_json_new)
)
;; ----------------------------------------------------------------------
(define (main args)
(define file_gdbm (car (cdr args)))
(define key_in (car (cddr args)))
(define population_in (car (cdddr args)))
(print "*** 開始 ***")
(print key_in)
(print population_in)
(let ((db (dbm-open <gdbm> :path file_gdbm :rw-mode :write)))

(if (dbm-exists? db key_in)
	(update_proc db key_in population_in)
	)
;;
(dbm-close db))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
