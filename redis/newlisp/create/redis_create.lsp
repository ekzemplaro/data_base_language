#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	redis_create.lsp
;
;					Jan/19/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/text_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/redis_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(define (dict_to_redis_proc dict_bb socket)
	(dolist (vv (dict_bb))
		(setf key (first vv))
		(setf rr (first (rest vv)))
		(setf json_str (unit_string_gen_proc
			 (last (assoc "name" rr))
			 (string (last (assoc "population" rr)))
			 (last (assoc "date_mod" rr))
			))
		(redis_socket_write_proc socket key json_str)
	)
)

; ------------------------------------------------------------------
(define (data_prepare)
;
(dict_aa "t1851" (unit_gen_proc "福井" 62184 "1933-7-7"))
(dict_aa "t1852" (unit_gen_proc "敦賀" 31927 "1933-9-18"))
(dict_aa "t1853" (unit_gen_proc "小浜" 83542 "1933-2-22"))
(dict_aa "t1854" (unit_gen_proc "大野" 54186 "1933-5-9"))
(dict_aa "t1855" (unit_gen_proc "勝山" 68375 "1933-1-21"))
(dict_aa "t1856" (unit_gen_proc "鯖江" 23451 "1933-8-13"))
(dict_aa "t1857" (unit_gen_proc "あわら" 71842 "1933-1-8"))
(dict_aa "t1858" (unit_gen_proc "越前" 82317 "1933-10-30"))
(dict_aa "t1859" (unit_gen_proc "坂井" 57296 "1933-7-15"))
;
)

; ------------------------------------------------------------------
(println "*** 開始 ***")
;
;
(setf hostname "host_dbase") 
(setf port 6379) 
(set 'socket (net-connect hostname port))
;
(new Tree 'dict_aa)
(data_prepare)
;
(dict_to_redis_proc dict_aa socket)
;
(net-close socket)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
