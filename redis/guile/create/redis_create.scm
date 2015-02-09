#!/usr/bin/guile -s
!#
;; ----------------------------------------------------------------------
;;	redis_create.scm
;;
;;						Jan/20/2015
;;
;; ----------------------------------------------------------------------
(load "/var/www/data_base/common/guile_common/text_manipulate.scm")
;; ----------------------------------------------------------------------
(define (data_prepare_proc)
	(define dict_aa (make-hash-table))

(dict_append_proc dict_aa (string->symbol "t1851") "福井" 71932 "1972-3-18")
(dict_append_proc dict_aa (string->symbol "t1852") "敦賀" 54731 "1972-7-5")
(dict_append_proc dict_aa (string->symbol "t1853") "小浜" 57182 "1972-8-9")
(dict_append_proc dict_aa (string->symbol "t1854") "大野" 83296 "1972-9-19")
(dict_append_proc dict_aa (string->symbol "t1855") "勝山" 35947 "1972-4-30")
(dict_append_proc dict_aa (string->symbol "t1856") "鯖江" 13658 "1972-8-17")
(dict_append_proc dict_aa (string->symbol "t1857") "あわら" 56713 "1972-2-19")
(dict_append_proc dict_aa (string->symbol "t1858") "越前" 47159 "1972-5-13")
(dict_append_proc dict_aa (string->symbol "t1859") "坂井" 61952 "1972-9-7")
	dict_aa
)
;; ----------------------------------------------------------------------
(define (to_redis_proc host port dict_aa)
		(display "*** aaa ***\n")
		(hash-fold (lambda (key value seed)
		(define unit (hashq-ref dict_aa key))
		(define name (hashq-ref unit 'name))
		(define population (hashq-ref unit 'population))
		(define date_mod (hashq-ref unit 'date_mod))
		(format #t "~a\t" key)
		(format #t "~a\t" name)
		(format #t "~a\t" population)
		(format #t "~a\n" date_mod)
		(+ 1 seed)
		)   0 dict_aa)
		(display "*** bbb ***\n")
)

;; ----------------------------------------------------------------------
(let ((port (current-output-port)))
            (set-port-encoding! port "utf-8"))

(setlocale LC_ALL "")
(display "*** 開始 ***\n")

;; ----------------------------------------------------------------------
(define host "172.20.248.69")
(define port 6379)
(let ((dict_aa (data_prepare_proc)))
	(display "*** aaa ***\n")
	(to_redis_proc host port dict_aa)
	(display "*** ppp ***\n")
)
;; ----------------------------------------------------------------------
(display "*** 終了 ***\n")
;; ----------------------------------------------------------------------

