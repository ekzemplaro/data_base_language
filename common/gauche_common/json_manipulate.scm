#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	json_manipulate.scm
;;
;;					Feb/11/2011
;;
;; ----------------------------------------------------------------------
;; (use text.json)
(use rfc.json)
(use slib)

;; ----------------------------------------------------------------------
(define (display_line_proc vector_aa)
	(define id (cdar vector_aa))
	(define name (cdadr vector_aa))
	(define population (cdr (ref vector_aa 2)))
	(define date_mod (cdr (ref vector_aa 3)))
	(define list_out (list (number->string id) name (number->string population) date_mod))
	(define str_out (string-join list_out "\t"))
	(display str_out)
	(newline)
	)
;; ----------------------------------------------------------------------
(define (json_display_proc list nn)
	(if (< nn (vector-length (cdar list)))
		(begin
		(display_line_proc (vector-ref (cdar list) nn))
		(json_display_proc list (+ nn 1))
		)
	))
;; ----------------------------------------------------------------------
