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
(print "*** 開始 ***")
(set conn 't1731 "{\"name\":\"金沢\",\"population\":92650,\"date_mod\":\"1971-9-15\"}")
(set conn 't1732 "{\"name\":\"輪島\",\"population\":46070,\"date_mod\":\"1971-4-16\"}")
(set conn 't1733 "{\"name\":\"小松\",\"population\":32050,\"date_mod\":\"1971-7-12\"}")
(set conn 't1734 "{\"name\":\"七尾\",\"population\":22070,\"date_mod\":\"1971-2-18\"}")
(set conn 't1735 "{\"name\":\"珠洲\",\"population\":62080,\"date_mod\":\"1971-5-11\"}")
;;
(print (get conn 't1731))
(print (get conn 't1732))
(print (get conn 't1733))
(print (get conn 't1734))
(print (get conn 't1735))
(print "*** 終了 ***")
0
)
;; ----------------------------------------------------------------------
