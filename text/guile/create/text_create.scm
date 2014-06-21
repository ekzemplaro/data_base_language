#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	text_create.scm
;;
;;						Feb/20/2014
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
	(define dict_aa (make-hash-table))

(dict_append_proc dict_aa (string->symbol "t2381") "名古屋" 56739 "1972-3-18")
(dict_append_proc dict_aa (string->symbol "t2382") "豊橋" 82531 "1972-7-5")
(dict_append_proc dict_aa (string->symbol "t2383") "岡崎" 31472 "1972-8-9")
(dict_append_proc dict_aa (string->symbol "t2384") "一宮" 49836 "1972-9-19")
(dict_append_proc dict_aa (string->symbol "t2385") "蒲郡" 28357 "1972-4-30")
(dict_append_proc dict_aa (string->symbol "t2386") "常滑" 73865 "1972-8-17")
(dict_append_proc dict_aa (string->symbol "t2387") "大府" 56213 "1972-2-19")
(dict_append_proc dict_aa (string->symbol "t2388") "瀬戸" 47859 "1972-5-13")
(dict_append_proc dict_aa (string->symbol "t2389") "犬山" 61452 "1972-9-7")
	dict_aa
)
;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))

(setlocale LC_ALL "")
(display "*** 開始 ***\n")
(define file_out (cadr (command-line)))

;; ----------------------------------------------------------------------
(let ((dict_aa (data_prepare_proc)))
	(text_write_proc file_out dict_aa)
)
;; ----------------------------------------------------------------------
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

