#! /usr/bin/racket
#lang racket
;
;	text_create.rkt
;
;						Mar/17/2014
;
; ----------------------------------------------------------------
(define (record_out_proc out key name population date_mod)
	(define str_out (string-append key "\t" name "\t" (number->string population) "\t" date_mod "\n"))
	(display str_out out)
)
; ----------------------------------------------------------------
(printf "*** 開始 ***\n")
(define args (current-command-line-arguments))
(define file_out (vector-ref args 0))
(displayln file_out)
;
(define out (open-output-file file_out #:exists 'truncate))
(record_out_proc out "t2381" "名古屋" 76139 "2011-5-18")
(record_out_proc out "t2382" "豊橋" 88931 "2011-1-5")
(record_out_proc out "t2383" "岡崎" 35672 "2011-8-9")
(record_out_proc out "t2384" "一宮" 41236 "2011-9-19")
(record_out_proc out "t2385" "蒲郡" 24357 "2011-4-30")
(record_out_proc out "t2386" "常滑" 79865 "2011-8-17")
(record_out_proc out "t2387" "大府" 56213 "2011-2-19")
(record_out_proc out "t2388" "瀬戸" 47859 "2011-5-13")
(record_out_proc out "t2389" "犬山" 61452 "2011-9-7")
(close-output-port out)
;
;
(printf "*** 終了 ***\n")
; ----------------------------------------------------------------
