#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	xml_read.scm
;;
;;					Nov/05/2010
;;
;; ----------------------------------------------------------------------
(use sxml.ssax)
(use sxml.sxpath)

;; ----------------------------------------------------------------------
(define (display_all_proc aas bbs ccs dds)
	(if (pair? aas)
		(begin
		(display
		(string-join
		(append
		(cdr (car aas))
		(cdr (car bbs))
		(cdr (car ccs))
		(cdr (car dds))) "\t"))
		(newline)
		(display_all_proc (cdr aas) (cdr bbs) (cdr ccs) (cdr dds)))))
;; ----------------------------------------------------------------------
(define (main args)
(define file_in (car (cdr args)))
(display "*** 開始 ***\n")
;; ----------------------------------------------------------------------
(call-with-input-file file_in
  (lambda (pin)
    (let ((sxml-data (ssax:xml->sxml pin '())))
      (let ((aas  ((sxpath '(root cities id)) sxml-data))
      	(bbs  ((sxpath '(root cities name)) sxml-data))
      	(ccs  ((sxpath '(root cities population)) sxml-data))
      	(dds  ((sxpath '(root cities date_mod)) sxml-data)))
	(newline)
	(display_all_proc aas bbs ccs dds)
	)
      (newline)
      )))
(display "*** 終了 ***\n")
0
)
;; ----------------------------------------------------------------------
