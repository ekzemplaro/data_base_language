#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_read.lsp
;
;					Jan/24/2014
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t4761" "t4762" "t4763" "t4764" "t4765"
	"t4766" "t4767" "t4768" "t4769"))
;
(setf hostname "localhost") 
(setf port 1978) 
(set 'socket (net-connect hostname port))
;
(dolist (key keys)
	(mcached_read_proc socket key))
(net-close socket)
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
