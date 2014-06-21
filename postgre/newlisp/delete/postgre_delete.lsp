#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	postgre_delete.lsp
;
;					Jan/27/2014
;
; -------------------------------------------------------------------
(module "postgres.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")

(setf id_in (main-args 2))
;
(println id_in)

(PgSQL:connect "localhost" "scott" "tiger" "city")

(setf sql_command (format "delete from cities  where id = '%s';" id_in))
(println sql_command)

(PgSQL:query sql_command)

(PgSQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
