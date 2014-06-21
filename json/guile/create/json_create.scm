#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	json_create.scm
;;
;;						Feb/21/2014
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (json_generate_proc dict_aa)
	(define out_str "")
;;
	(set! out_str (string-append out_str (format #f "{\n")))
	(hash-fold (lambda (key value seed)
		(define uu (hashq-ref dict_aa key))
		(set! out_str (string-append out_str (format #f "\"~a\": {" (symbol->string key))))
		(set! out_str (string-append out_str (format #f "\"name\": \"~a\"," (hashq-ref uu 'name))))
		(set! out_str (string-append out_str (format #f "\"population\": ~a," (hashq-ref uu 'population))))
		(set! out_str (string-append out_str (format #f "\"date_mod\": \"~a\"}" (hashq-ref uu 'date_mod))))
		(set! out_str (string-append out_str ",\n"))
		(+ 1 seed)
		)   0 dict_aa)
;;
	(display (string-length out_str))
	(string-set! out_str (- (string-length out_str) 2) #\})
	(string-append out_str "")
)

;; ----------------------------------------------------------------------
(define (json_write_proc file_out dict_aa)
	(define  json_str (json_generate_proc dict_aa))
	(with-output-to-file file_out (lambda () 
			(format #t json_str)
		))
)
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
	(define dict_aa (make-hash-table))

(dict_append_proc dict_aa (string->symbol "t0921") "宇都宮" 53279 "1972-10-12")
(dict_append_proc dict_aa (string->symbol "t0922") "小山" 31982 "1972-9-15")
(dict_append_proc dict_aa (string->symbol "t0923") "佐野" 37419 "1972-7-27")
(dict_append_proc dict_aa (string->symbol "t0924") "足利" 91846 "1972-8-19")
(dict_append_proc dict_aa (string->symbol "t0925") "日光" 28957 "1972-2-30")
(dict_append_proc dict_aa (string->symbol "t0926") "下野" 31765 "1972-6-17")
(dict_append_proc dict_aa (string->symbol "t0927") "日光" 58943 "1972-1-19")
(dict_append_proc dict_aa (string->symbol "t0928") "矢板" 47329 "1972-5-13")
(dict_append_proc dict_aa (string->symbol "t0929") "真岡" 67521 "1972-9-7")
(dict_append_proc dict_aa (string->symbol "t0930") "栃木" 92737 "1972-3-19")
(dict_append_proc dict_aa (string->symbol "t0931") "大田原" 58761 "1972-5-21")
(dict_append_proc dict_aa (string->symbol "t0932") "鹿沼" 46182 "1972-2-12")
(dict_append_proc dict_aa (string->symbol "t0933") "那須塩原" 82956 "1972-6-18")
(dict_append_proc dict_aa (string->symbol "t0934") "那須烏山" 13869 "1972-9-25")

dict_aa
)

;; ----------------------------------------------------------------------
(setlocale LC_ALL "")
(display "*** 開始 ***\n")
(define file_out (cadr (command-line)))

(let ((dict_aa (data_prepare_proc)))
	(json_write_proc file_out dict_aa)
)

(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------
