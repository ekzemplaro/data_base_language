#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	text_maniulate.scm
;;
;;						Mar/02/2011
;; ----------------------------------------------------------------------
(use srfi-19)

;; ----------------------------------------------------------------------
(define (text_read_proc_exec file_in doc_aa delimit)
(define input-port (open-input-file file_in))
(define list_aa (port->string-list input-port))
(display (length list_aa))
(display "\n")
(for-each (lambda (line)
	(define unit_list (string-split line delimit))
	(define id (car unit_list))
	(define name (cadr unit_list))
	(define population (caddr unit_list))
	(define date_mod (cadddr unit_list))
	(dict_append_proc doc_aa id name population date_mod)
	)
	list_aa)

(close-input-port input-port)
)

;; ----------------------------------------------------------------------
(define (text_read_proc file_in doc_aa)
	(define delimit "\t")
	(text_read_proc_exec file_in doc_aa delimit)
)

;; ----------------------------------------------------------------------
(define (dict_display_proc doc_aa)
	(hash-table-for-each doc_aa (lambda (key value)
		(define uu (hash-table-get doc_aa key))
		(display key)
		(display "\t")
		(display (hash-table-get uu 'name))
		(display "\t")
		(display (hash-table-get uu 'population))
		(display "\t")
		(display (hash-table-get uu 'date_mod))
		(display "\n")
		))
)

;; ----------------------------------------------------------------------
(define (text_write_proc_exec file_out doc_aa delimit)
	(define output-port (open-output-file file_out))
	(print "*** text_write_proc ***")
	(hash-table-for-each doc_aa (lambda (key value)
		(define uu (hash-table-get doc_aa key))
		(display key output-port)
		(display delimit output-port)
		(display (hash-table-get uu 'name) output-port)
		(display delimit output-port)
		(display (hash-table-get uu 'population) output-port)
		(display delimit output-port)
		(display (hash-table-get uu 'date_mod) output-port)
		(display "\n" output-port)
		))
		(close-output-port output-port)
)

;; ----------------------------------------------------------------------
(define (text_write_proc file_out doc_aa)
	(define delimit "\t")
	(text_write_proc_exec file_out doc_aa delimit)
)

;; ----------------------------------------------------------------------
(define (dict_append_proc doc_aa id name population date_mod)
	(define unit_aa (make-hash-table))
	(hash-table-put! unit_aa 'name name)
	(hash-table-put! unit_aa 'population population)
	(hash-table-put! unit_aa 'date_mod date_mod)
	(hash-table-put! doc_aa id unit_aa)
)

;; ----------------------------------------------------------------------
(define (dict_update_proc doc_aa id_in population_in)
	(define today (date->string (current-date) "~Y-~m-~d"))
	(define uu (hash-table-get doc_aa id_in))
	(display "*** dict_update_proc ***\n")
	(hash-table-put! uu 'population population_in)
	(hash-table-put! uu 'date_mod today)
)

;; ----------------------------------------------------------------------
(define (csv_read_proc file_in doc_aa)
	(define delimit ",")
	(text_read_proc_exec file_in doc_aa delimit)
)

;; ----------------------------------------------------------------------
(define (csv_write_proc file_out doc_aa)
	(define delimit ",")
	(text_write_proc_exec file_out doc_aa delimit)
)

;; ----------------------------------------------------------------------
