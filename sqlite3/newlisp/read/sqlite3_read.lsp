; -------------------------------------------------------------------
;	sqlite3_read.lsp
;
;					Sep/23/2013
;
; -------------------------------------------------------------------
;(load "/usr/share/newlisp/modules/sqlite3.lsp")
(module "sqlite3.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_sqlite3 (main-args 3))
(println file_sqlite3)
(sql3:open file_sqlite3)
;
(println (sql3:tables))
(println (sql3:columns "cities"))
;
(define list_aa (sql3:sql "select * from cities;"))
;(println list_aa)
;
(dolist (unit list_aa)
	(print (unit 0)) 
	(print "\t") 
	(print (unit 1)) 
	(print "\t") 
	(print (unit 2)) 
	(print "\t") 
	(println (unit 3)) 
;	(println unit)
	)
(sql3:close)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
