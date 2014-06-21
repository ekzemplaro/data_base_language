#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	csv_create.lsp
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
(dict_aa "t1271" (unit_gen_proc "千葉" 63814 "1933-1-3"))
(dict_aa "t1272" (unit_gen_proc "勝浦" 36927 "1933-8-15"))
(dict_aa "t1273" (unit_gen_proc "市原" 85372 "1933-9-22"))
(dict_aa "t1274" (unit_gen_proc "流山" 91546 "1933-4-30"))
(dict_aa "t1275" (unit_gen_proc "八千代" 51375 "1933-6-21"))
(dict_aa "t1276" (unit_gen_proc "我孫子" 29451 "1933-5-13"))
(dict_aa "t1277" (unit_gen_proc "鴨川" 73842 "1933-1-8"))
(dict_aa "t1278" (unit_gen_proc "銚子" 89317 "1933-4-30"))
(dict_aa "t1279" (unit_gen_proc "市川" 59236 "1933-7-15"))
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
(csv_write_proc file_out)
;
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
