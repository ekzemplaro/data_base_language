#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	gdbm_delete.scm
;;
;;					Oct/15/2013
;;
;; ----------------------------------------------------------------------
(use dbm.gdbm)
;; ----------------------------------------------------------------------
(define (main args)
(define file_gdbm (car (cdr args)))
(define key_in (car (cddr args)))
(print "*** 開始 ***")
(print key_in)
(let ((db (dbm-open <gdbm> :path file_gdbm :rw-mode :write)))
(dbm-delete! db key_in)

(dbm-close db))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
