#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mcachedb_read.scm
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
(define conn (memcache-connect "localhost" 21201))
(print "*** 開始 ***")

(display_proc conn 't1521)
(display_proc conn 't1522)
(display_proc conn 't1523)
(display_proc conn 't1524)
(display_proc conn 't1525)
(display_proc conn 't1526)
(display_proc conn 't1527)
(display_proc conn 't1528)
(display_proc conn 't1529)
(display_proc conn 't1530)
(display_proc conn 't1530)
(display_proc conn 't1531)
(display_proc conn 't1532)

(print "*** 終了 ***")

0
)
;; ----------------------------------------------------------------------
