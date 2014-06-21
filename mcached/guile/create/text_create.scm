#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	text_create.scm
;;
;;						Aug/03/2011
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(display "*** 開始 ***\n")
(define file_out (cadr (command-line)))
(define doc_aa (make-hash-table))

(dict_append_proc doc_aa (string->symbol "t2381") "名古屋" 51739 "1972-5-18")
(dict_append_proc doc_aa (string->symbol "t2382") "豊橋" 85631 "1972-7-5")
(dict_append_proc doc_aa (string->symbol "t2383") "岡崎" 39472 "1972-8-9")
(dict_append_proc doc_aa (string->symbol "t2384") "一宮" 41836 "1972-9-19")
(dict_append_proc doc_aa (string->symbol "t2385") "蒲郡" 26357 "1972-4-30")
(dict_append_proc doc_aa (string->symbol "t2386") "常滑" 73865 "1972-8-17")
(dict_append_proc doc_aa (string->symbol "t2387") "大府" 56213 "1972-2-19")
(dict_append_proc doc_aa (string->symbol "t2388") "瀬戸" 47859 "1972-5-13")
(dict_append_proc doc_aa (string->symbol "t2389") "犬山" 61452 "1972-9-7")
;; ----------------------------------------------------------------------
(display (hash-fold (lambda (key value seed) (+ 1 seed)) 0 doc_aa))
(display "\n")

(dict_display_proc doc_aa)

;; ----------------------------------------------------------------------
(text_write_proc file_out doc_aa)
;; ----------------------------------------------------------------------
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

