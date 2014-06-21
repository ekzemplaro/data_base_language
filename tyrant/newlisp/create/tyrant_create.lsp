#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	tyrant_create.lsp
;
;					Jan/28/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(define (data_prepare)
;
(dict_aa "t4761" (unit_gen_proc "那覇" 38574 "1933-9-12"))
(dict_aa "t4762" (unit_gen_proc "宜野湾" 92468 "1933-2-25"))
(dict_aa "t4763" (unit_gen_proc "石垣" 87412 "1933-5-7"))
(dict_aa "t4764" (unit_gen_proc "浦添" 19368 "1933-1-8"))
(dict_aa "t4765" (unit_gen_proc "名護" 51375 "1933-2-21"))
(dict_aa "t4766" (unit_gen_proc "糸満" 29451 "1933-8-13"))
(dict_aa "t4767" (unit_gen_proc "沖縄" 73842 "1933-8-8"))
(dict_aa "t4768" (unit_gen_proc "豊見城" 82317 "1933-4-30"))
(dict_aa "t4769" (unit_gen_proc "うるま" 57236 "1933-7-15"))
;
)

; ------------------------------------------------------------------
(println "*** 開始 ***")
;
;
(setf hostname "localhost") 
(setf port 1978) 
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
