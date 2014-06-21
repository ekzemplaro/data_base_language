#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	postgre_read.lsp
;
;					Jan/27/2014
;
; -------------------------------------------------------------------
(module "postgres.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")

(PgSQL:connect "localhost" "scott" "tiger" "city")
(println (PgSQL:tables))
;
(PgSQL:query "select id,name,population,date_mod from cities")
(println (PgSQL:num-rows))
(println (PgSQL:num-fields))
(setf list_aa (PgSQL:fetch-all))
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
	)
(PgSQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
