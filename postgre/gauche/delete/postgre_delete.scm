#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	postgre_delete.scm
;;
;;					Sep/30/2010
;;
;; ----------------------------------------------------------------------
(use dbi)
(use gauche.sequence)
;; ----------------------------------------------------------------------
(define (main args)
(define id_in (cadr args))
(define connection (dbi-connect "dbi:pg:dbname=city;host=localhost"
	 :username "scott" :password "tiger"))
(define query (dbi-make-query connection))
(print "*** 開始 ***")
(print id_in)
(let* ((query (dbi-prepare connection
	"delete from cities where ID= ?")))
  (dbi-execute query id_in))
(dbi-close connection)
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
