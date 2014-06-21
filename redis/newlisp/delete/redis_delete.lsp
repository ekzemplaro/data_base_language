#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	redis_delete.lsp
;
;					Apr/23/2011
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf key_in (main-args 2))
(println "*** aaaa ***")
(println key_in)
(setf command (format "del %s\r\n" key_in))
(setf hostname "host_dbase") 
(setf port 6379) 
(set 'socket (net-connect hostname port))
(net-send socket command)
(net-receive socket buffer 10000)
(println buffer)
(net-close socket)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
