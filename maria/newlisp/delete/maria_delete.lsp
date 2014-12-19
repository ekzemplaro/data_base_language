; -------------------------------------------------------------------
;	maria_delete.lsp
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

(setf sql_command (format "delete from cities  where id = '%s';" id_in))

(println sql_command)

(MySQL:query sql_command)

(MySQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
