#! /usr/bin/newlisp
; -------------------------------------------------------------------
;
;	mcached_read.lsp
;
;					Feb/10/2015
; -------------------------------------------------------------------
(load "/var/www/data_base/common/newlisp_common/mcached_manipulate.lsp")
; ------------------------------------------------------------------
(println "*** 開始 ***")
(set 'keys '("t4761" "t4762" "t4763" "t4764" "t4765"
	"t4766" "t4767" "t4768" "t4769"))
;
(setf hostname "host_ubuntu1") 
(setf port 1978) 
;
(mcached_display_proc hostname port keys)
;
(println "*** 終了 ***")
(exit)
; ------------------------------------------------------------------
