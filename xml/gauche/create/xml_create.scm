#! /usr/bin/gosh
;; -*- coding: utf-8 -*-
;; ----------------------------------------------------------------------
;;	xml_create.scm
;;
;;					Aug/09/2011
;;
;; ----------------------------------------------------------------------
(use sxml.serializer)
(define (main args)
(define file_out (car (cdr args)))
(define output-port (open-output-file file_out))
(define blog-rss
	'(*TOP* (*PI* xml "version=\"1.0\" encoding=\"UTF-8\"")
	(root
	(t2261 (name "静岡") (population "53819") (date_mod "1971-4-21"))
	(t2262 (name "浜松") (population "74576") (date_mod "1971-8-15"))
	(t2263 (name "沼津") (population "24631") (date_mod "1971-9-24"))
	(t2264 (name "三島") (population "84672") (date_mod "1971-3-18"))
	(t2265 (name "富士") (population "14536") (date_mod "1971-2-8"))
	(t2266 (name "熱海") (population "72318") (date_mod "1971-5-7"))
	(t2267 (name "富士宮") (population "42826") (date_mod "1971-6-29"))
	(t2268 (name "藤枝") (population "82397") (date_mod "1971-10-30"))
	(t2269 (name "御殿場") (population "52342") (date_mod "1971-8-25"))
	(t2270 (name "島田") (population "62314") (date_mod "1971-12-3"))
	)))
(display "*** 開始 ***\n")
(display (srl:sxml->xml blog-rss) output-port)
(close-output-port output-port)
(display "*** 終了 ***\n")
0
)
