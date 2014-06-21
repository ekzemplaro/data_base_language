#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mcached_update.scm
;;
;;					Jun/24/2011
;;
;; ----------------------------------------------------------------------
(use memcache)
(use slib)
;; ----------------------------------------------------------------------
(define (display_exec_proc list)
	(format #t "~a\t" (list-ref list 0))
	(format #t "~a\t" (list-ref list 3))
	(format #t "~a\t" (list-ref list 5))
	(format #t "~a\n" (list-ref list 8))
;;	(print list)
)
;; ----------------------------------------------------------------------
(define (main args)
(define key (car (cdr args)))
(define population_in (caddr args))

(define conn (memcache-connect "localhost" 11211))
(print "*** 開始 ***")
(print key)
(print population_in)

;; (print (delete conn key))
(if (not (null? (get conn key)))
		(print (get conn key))
;;		(display_exec_proc (car (get conn key)))
)
;;
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
