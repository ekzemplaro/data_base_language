#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_create.lsp
;
;					Jan/27/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(define (data_prepare)
;
(dict_aa "t1731" (unit_gen_proc "金沢" 61384 "1933-10-7"))
(dict_aa "t1732" (unit_gen_proc "輪島" 36927 "1933-5-18"))
(dict_aa "t1733" (unit_gen_proc "小松" 85742 "1933-8-22"))
(dict_aa "t1734" (unit_gen_proc "七尾" 59186 "1933-7-9"))
(dict_aa "t1735" (unit_gen_proc "珠洲" 51375 "1933-2-21"))
(dict_aa "t1736" (unit_gen_proc "加賀" 29451 "1933-8-13"))
(dict_aa "t1737" (unit_gen_proc "羽咋" 73842 "1933-1-8"))
(dict_aa "t1738" (unit_gen_proc "かほく" 82317 "1933-4-30"))
(dict_aa "t1739" (unit_gen_proc "白山" 57236 "1933-7-15"))
;
)

; ------------------------------------------------------------------
(println "*** 開始 ***")
;
;
(setf hostname "localhost") 
(setf port 11211) 
(set 'socket (net-connect hostname port))
;
(new Tree 'dict_aa)
(data_prepare)
;
(dict_to_mcached_proc socket)
;
(net-close socket)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
