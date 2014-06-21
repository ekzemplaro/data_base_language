#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	text_create.lsp
;
;					Jan/24/2014
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
; -------------------------------------------------------------------
(define (data_prepare)
(new Tree 'dict_aa)
	(println "*** data_prepare start ***")
;
(dict_aa "t2381" (unit_gen_proc "名古屋" 57614 "1933-7-9"))
(dict_aa "t2382" (unit_gen_proc "豊橋" 12367 "1933-2-28"))
(dict_aa "t2383" (unit_gen_proc "岡崎" 61852 "1933-5-14"))
(dict_aa "t2384" (unit_gen_proc "一宮" 59146 "1933-9-23"))
(dict_aa "t2385" (unit_gen_proc "蒲郡" 51375 "1933-2-21"))
(dict_aa "t2386" (unit_gen_proc "常滑" 29451 "1933-8-13"))
(dict_aa "t2387" (unit_gen_proc "大府" 73842 "1933-1-8"))
(dict_aa "t2388" (unit_gen_proc "瀬戸" 89317 "1933-4-30"))
(dict_aa "t2389" (unit_gen_proc "犬山" 59236 "1933-7-15"))
;
dict_aa
)

; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_out (main-args 2))
(println file_out)
;
(setf dict_aa (data_prepare))
;
(dict_display_proc)
;
(text_write_proc file_out)
;
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
