; -------------------------------------------------------------------
;	maria_update.lsp
;
;					Dec/15/2014
;
; -------------------------------------------------------------------
(module "mysql.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")

(setf id_in (main-args 3))
(setf population_in (main-args 4))
;
(println id_in)
(println population_in)

(MySQL:init)
(MySQL:connect "localhost" "scott" "tiger" "city")

(setf today (format "%s-%s-%s" (string ((now) 0)) (string ((now) 1)) (string ((now) 2))))
(setf sql_command (format 
	"update cities set population = %s, date_mod = '%s' where id = '%s';"
		population_in today id_in))
(println sql_command)

(MySQL:query sql_command)

(MySQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
