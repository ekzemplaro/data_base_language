#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	postgre_update.lsp
;
;					Jan/27/2014
;
; -------------------------------------------------------------------
(module "postgres.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")

(setf id_in (main-args 2))
(setf population_in (main-args 3))
;
(println id_in)
(println population_in)

(PgSQL:connect "localhost" "scott" "tiger" "city")

(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))
(setf sql_command (format 
	"update cities set population = %s, date_mod = '%s' where id = '%s';"
		population_in today id_in))
(println sql_command)

(PgSQL:query sql_command)

(PgSQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
