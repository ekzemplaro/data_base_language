#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	json_read.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use rfc.json)
;; ----------------------------------------------------------------------
(define (record_display rec_aa)
	(define key (car rec_aa))
	(define uu (cdr rec_aa))
	(define name (cdr (assoc "name" uu)))
;
	(define population (cdr (assoc "population" uu)))
;
	(define date_mod (cdr (assoc "date_mod" uu)))
;
	(define list_out (list key name (number->string population) date_mod))
	(define str_out (string-join list_out "\t"))
	(display str_out)
	(newline)
)
;; ----------------------------------------------------------------------
(define (main args)
(define file_json (car (cdr args)))
(define input-port (open-input-file file_json))
;
(define doc_aa (parse-json input-port))
;
(display "*** 開始 ***\n")
(map (lambda (dd) (record_display dd)) doc_aa)
(close-input-port input-port)
(display "*** 終了 ***\n")
0
)

;; ----------------------------------------------------------------------
