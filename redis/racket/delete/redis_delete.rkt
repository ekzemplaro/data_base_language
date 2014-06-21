#! /usr/bin/env racket
#lang racket
;
;	redis_delete.rkt
;
;						Mar/14/2014
;
; ----------------------------------------------------------------
(printf "*** 開始 ***\n")
(define args (current-command-line-arguments))
(define key_in (vector-ref args 0))
(define hostname "host_dbase")
(define port 6379)
(define command (string-append "del " key_in "\r\n"))
(displayln key_in)
(let-values ([(in out) (tcp-connect hostname port)])
	(display command out)
	(close-output-port out))
(printf "*** 終了 ***\n")
; ----------------------------------------------------------------
