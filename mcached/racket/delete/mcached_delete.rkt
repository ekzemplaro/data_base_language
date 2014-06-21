#! /usr/bin/env racket
#lang racket
;
;	mcached_delete.rkt
;
;						Mar/14/2014
;
; ----------------------------------------------------------------
(printf "*** 開始 ***\n")
(define args (current-command-line-arguments))
(define key_in (vector-ref args 0))
(define hostname "localhost")
(define port 11211)
(define command (string-append "delete " key_in "\r\n"))
(displayln key_in)
(let-values ([(in out) (tcp-connect hostname port)])
	(display command out)
	(close-output-port out))
(printf "*** 終了 ***\n")
; ----------------------------------------------------------------
