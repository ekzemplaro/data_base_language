#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcachedb_create.lsp
;
;					Jan/28/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(define (data_prepare)
;
(dict_aa "t1521" (unit_gen_proc "新潟" 61384 "1933-10-7"))
(dict_aa "t1522" (unit_gen_proc "長岡" 36927 "1933-5-18"))
(dict_aa "t1523" (unit_gen_proc "新発田" 85742 "1933-8-22"))
(dict_aa "t1524" (unit_gen_proc "上越" 59186 "1933-7-9"))
(dict_aa "t1525" (unit_gen_proc "糸魚川" 51375 "1933-2-21"))
(dict_aa "t1526" (unit_gen_proc "加茂" 29451 "1933-8-13"))
(dict_aa "t1527" (unit_gen_proc "三条" 73842 "1933-1-8"))
(dict_aa "t1528" (unit_gen_proc "佐渡" 82317 "1933-4-30"))
(dict_aa "t1529" (unit_gen_proc "柏崎" 57236 "1933-7-15"))
(dict_aa "t1530" (unit_gen_proc "村上" 38169 "1933-6-4"))
(dict_aa "t1531" (unit_gen_proc "十日町" 92571 "1933-2-21"))
(dict_aa "t1532" (unit_gen_proc "五泉" 84293 "1933-8-16"))
;
)

; ------------------------------------------------------------------
(println "*** 開始 ***")
;
(setf hostname "localhost") 
(setf port 21201) 
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
