#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	mcached_create.scm
;;
;;					Jun/24/2011
;;
;; ----------------------------------------------------------------------
(use memcache)
;; ----------------------------------------------------------------------
(define (main args)

(define conn (memcache-connect "localhost" 11211))
(define str_t1731 "{\"name\":\"金沢\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1732 "{\"name\":\"輪島\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1733 "{\"name\":\"小松\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1734 "{\"name\":\"七尾\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1735 "{\"name\":\"珠洲\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1736 "{\"name\":\"加賀\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1737 "{\"name\":\"羽咋\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1738 "{\"name\":\"かほく\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(define str_t1739 "{\"name\":\"白山\",\"population\":92651,\"date_mod\":\"1971-9-15\"}")
(print "*** 開始 ***")
(print str_t1731)
(set conn 't1731 str_t1731)
(set conn 't1732 str_t1732)
(set conn 't1733 str_t1733)
(set conn 't1734 str_t1734)
(set conn 't1735 str_t1735)
(set conn 't1736 str_t1736)
(set conn 't1737 str_t1737)
(set conn 't1738 str_t1738)
(set conn 't1739 str_t1739)
;;
(print (get conn "t1731"))
(print (get conn 't1732))
;; (print (get conn 't1733))
;; (print (get conn 't1734))
;; (print (get conn 't1735))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
