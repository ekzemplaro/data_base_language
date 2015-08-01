#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mcached_read.scm
;;
;;					Sep/03/2010
;;
;; ----------------------------------------------------------------------
(use memcache)
;; (use text.json)
(use slib)

;; ----------------------------------------------------------------------
(define (display_exec_proc list)
;;	(format #t "~a\t" (list-ref list 0))
;;	(format #t "~a\t" (list-ref list 3))
;;	(format #t "~a\t" (list-ref list 5))
;;	(format #t "~a\n" (list-ref list 8))
	(print list)
)

;; ----------------------------------------------------------------------
(define (display_proc conn key)
	(define json_str (get conn key))
	(if (not (null? json_str))
		(print json_str)
		(display_exec_proc json_str)
;;		(display_exec_proc (car json_str))
	)
)

;; ----------------------------------------------------------------------
(define (main args)
(define conn (memcache-connect "localhost" 11211))
(print "*** 開始 ***")


;; ----------------------------------------------------------------------
(display_proc conn 't1731)
(display_proc conn 't1732)
(display_proc conn 't1733)
(display_proc conn 't1734)
(display_proc conn 't1735)
(display_proc conn 't1736)
(display_proc conn 't1737)
(display_proc conn 't1738)
(display_proc conn 't1739)
;;
(print "*** 終了 ***")

0
)
;; ----------------------------------------------------------------------
