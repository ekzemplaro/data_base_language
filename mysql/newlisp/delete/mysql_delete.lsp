; -------------------------------------------------------------------
;	mysql_delete.lsp
;
;					Jul/11/2011
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
(MySQL:connect "host_mysql" "scott" "tiger" "city")

(MySQL:query "SET NAMES utf8")

(setf sql_command (format "delete from cities  where id = '%s';" id_in))

(println sql_command)

(MySQL:query sql_command)

(MySQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
