#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	redis_update.lsp
;
;					Jan/19/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/redis_manipulate.lsp")
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(define (redis_update_proc socket key_in population_in)
	(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))
	(setf json_str (mcached_socke_read_proc socket key_in))
	(setf unit_aa (json-parse json_str))
	(setf name (last (assoc "name" unit_aa)))
	(setf json_new (unit_string_gen_proc (last (assoc "name" unit_aa))  population_in today))
;
	(redis_socket_write_proc socket key_in json_new)
)
; ------------------------------------------------------------------
(println "*** 開始 ***")
;
(setf key_in (main-args 2))
(setf population_in (main-args 3))
;
(println key_in)
(println population_in)
;
(setf hostname "host_dbase") 
(setf port 6379) 
(set 'socket (net-connect hostname port))
;
(redis_read_proc socket key_in)
(redis_update_proc socket key_in population_in)
;
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
