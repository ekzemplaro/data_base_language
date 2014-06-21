#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	csv_create.scm
;;
;;						Feb/21/2014
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
(define dict_aa (make-hash-table))

(dict_append_proc dict_aa (string->symbol "t1271") "千葉" 27139 "1972-5-24")
(dict_append_proc dict_aa (string->symbol "t1272") "勝浦" 82931 "1972-6-12")
(dict_append_proc dict_aa (string->symbol "t1273") "市原" 37532 "1972-8-27")
(dict_append_proc dict_aa (string->symbol "t1274") "流山" 48936 "1972-9-19")
(dict_append_proc dict_aa (string->symbol "t1275") "八千代" 28357 "1972-5-30")
(dict_append_proc dict_aa (string->symbol "t1276") "我孫子" 36915 "1972-8-17")
(dict_append_proc dict_aa (string->symbol "t1277") "鴨川" 51963 "1972-2-19")
(dict_append_proc dict_aa (string->symbol "t1278") "銚子" 47529 "1972-5-13")
(dict_append_proc dict_aa (string->symbol "t1279") "市川" 64382 "1972-9-7")
dict_aa
)

;; ----------------------------------------------------------------------
(setlocale LC_ALL "")
(display "*** 開始 ***\n")
(define file_out (cadr (command-line)))

(let ((dict_aa (data_prepare_proc)))
	(csv_write_proc file_out dict_aa)
)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

