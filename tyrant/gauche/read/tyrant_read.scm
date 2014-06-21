#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	tyrant_read.scm
;;
;;					Jun/24/2011
;;
;; ----------------------------------------------------------------------
(use memcache)
(use text.json)
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
(define (display_proc conn key)
	(if (not (null? (get conn key)))
		(display_exec_proc (car (get conn key)))
	)
)

;; ----------------------------------------------------------------------
(define (main args)
(define conn (memcache-connect "localhost" 1978))
(print "*** 開始 ***")


;; ----------------------------------------------------------------------
(display_proc conn 't4761)
(display_proc conn 't4762)
(display_proc conn 't4763)
(display_proc conn 't4764)
(display_proc conn 't4765)
(display_proc conn 't4766)
(display_proc conn 't4767)
(display_proc conn 't4768)
(display_proc conn 't4769)
;;
(print "*** 終了 ***")

0
)
;; ----------------------------------------------------------------------
