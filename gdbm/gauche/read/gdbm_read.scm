#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	gdbm_read.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use dbm.gdbm)
(use rfc.json)
;; ----------------------------------------------------------------------
(define (record_display_proc key data)
	(define uu (parse-json-string data))
	(define name (cdr (assoc "name" uu)))
	(define population (cdr (assoc "population" uu)))
	(define date_mod (cdr (assoc "date_mod" uu)))
	(define list_out (list key name (number->string population) date_mod))
	(define str_out (string-join list_out "\t"))
	(display str_out)
	(newline)
)

;; ----------------------------------------------------------------------
(define (dbm_out_proc db key)
	(if (dbm-exists? db key)
		(record_display_proc key (dbm-get db key #f))
		)
)

;; ----------------------------------------------------------------------
(define (main args)
(define file_gdbm (car (cdr args)))
(print "*** 開始 ***")
(let ((db (dbm-open <gdbm> :path file_gdbm :rw-mode :read)))
(dbm_out_proc db "t2151")
(dbm_out_proc db "t2152")
(dbm_out_proc db "t2153")
(dbm_out_proc db "t2154")
(dbm_out_proc db "t2155")
(dbm_out_proc db "t2156")
(dbm_out_proc db "t2157")
(dbm_out_proc db "t2158")
(dbm_out_proc db "t2159")
(dbm_out_proc db "t2160")
;;
(dbm-close db))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
