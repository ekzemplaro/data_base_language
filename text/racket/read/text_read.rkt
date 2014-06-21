#! /usr/bin/racket
#lang racket
;
;	text_read.rkt
;
;						Mar/17/2014
;
; ----------------------------------------------------------------
(define (show_unit_proc key unit_aa)
	(display key)
	(display "\t")
	(display (hash-ref unit_aa "name"))
	(display "\t")
	(display (hash-ref unit_aa "population"))
	(display "\t")
	(display (hash-ref unit_aa "date_mod"))
	(newline)
)
; ----------------------------------------------------------------
(define (show_line_proc line_in)
	(define cols (string-split line_in))
	(define key (list-ref cols 0))
	(define name (list-ref cols 1))
	(define population (list-ref cols 2))
	(define date_mod (list-ref cols 3))
	(define unit_aa (make-hash))
	(hash-set! unit_aa "name" name)
	(hash-set! unit_aa "population" population)
	(hash-set! unit_aa "date_mod" date_mod)
	(show_unit_proc key unit_aa)
)

; ----------------------------------------------------------------
(define (read-next-line-iter file)
	(let ((line (read-line file)))
		(unless (eof-object? line)
		(show_line_proc line)
		(read-next-line-iter file))))
;
; ----------------------------------------------------------------
(printf "*** 開始 ***\n")
(define args (current-command-line-arguments))
(define file_in (vector-ref args 0))
(displayln file_in)
;
(call-with-input-file file_in read-next-line-iter)
(printf "*** 終了 ***\n")
; ----------------------------------------------------------------
