#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	xml_create.scm
;;
;;						Oct/29/2013
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (xml_display_proc doc_aa)
	(format #t "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
	(format #t "<root>\n")
	(hash-fold (lambda (key value seed)
		(define uu (hashq-ref doc_aa key))
		(format #t "\t<~a>\n" (symbol->string key))
		(format #t "\t<name>~a</name>\n" (hashq-ref uu 'name))
		(format #t "\t<population>~a</population>\n" (hashq-ref uu 'population))
		(format #t "\t<date_mod>~a</date_mod>\n" (hashq-ref uu 'date_mod))
		(format #t "\t</~a>\n" (symbol->string key))
		(+ 1 seed)
		)   0 doc_aa)
	(format #t "</root>\n")
)

;; ----------------------------------------------------------------------
(define (xml_write_proc file_out doc_aa)
	(with-output-to-file file_out (lambda () 
			(xml_display_proc doc_aa)
		))
)
;; ----------------------------------------------------------------------
(setlocale LC_ALL "")
(display "*** 開始 ***\n")
(define file_out (cadr (command-line)))
(define doc_aa (make-hash-table))

(dict_append_proc doc_aa (string->symbol "t2261") "静岡" 53139 "1972-2-12")
(dict_append_proc doc_aa (string->symbol "t2262") "浜松" 31824 "1972-10-15")
(dict_append_proc doc_aa (string->symbol "t2263") "沼津" 37926 "1972-8-27")
(dict_append_proc doc_aa (string->symbol "t2264") "三島" 41238 "1972-9-19")
(dict_append_proc doc_aa (string->symbol "t2265") "富士" 27351 "1972-5-30")
(dict_append_proc doc_aa (string->symbol "t2266") "熱海" 38956 "1972-8-17")
(dict_append_proc doc_aa (string->symbol "t2267") "富士宮" 53912 "1972-2-19")
(dict_append_proc doc_aa (string->symbol "t2268") "藤枝" 45932 "1972-5-13")
(dict_append_proc doc_aa (string->symbol "t2269") "御殿場" 61728 "1972-9-7")
(dict_append_proc doc_aa (string->symbol "t2270") "島田" 28745 "1972-3-19")
;; ----------------------------------------------------------------------
(display (hash-fold (lambda (key value seed) (+ 1 seed)) 0 doc_aa))
(display "\n")

(dict_display_proc doc_aa)

;; ----------------------------------------------------------------------
(xml_write_proc file_out doc_aa)
;; ----------------------------------------------------------------------
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

