; -------------------------------------------------------------------
;	sqlite3_update.lsp
;
;					Sep/23/2013
;
; -------------------------------------------------------------------
(module "sqlite3.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_sqlite3 (main-args 3))
(setf id_in (main-args 4))
(setf population_in (main-args 5))
;
(println file_sqlite3)
(println id_in)
(println population_in)
;
(sql3:open file_sqlite3)
(println (now))
(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))
(setf sql_command (format 
	"update cities set population = %s, date_mod = '%s' where id = '%s';"
		population_in today id_in))
(println sql_command)
;
(sql3:sql sql_command)
;
(sql3:close)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
