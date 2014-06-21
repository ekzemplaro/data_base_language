; -------------------------------------------------------------------
;	sqlite3_delete.lsp
;
;					Sep/23/2013
;
; -------------------------------------------------------------------
(module "sqlite3.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_sqlite3 (main-args 3))
(setf id_in (main-args 4))
;
(println file_sqlite3)
(println id_in)
;
(sql3:open file_sqlite3)
(setf sql_command (format "delete from cities  where id = '%s';" id_in))
(println sql_command)
;
(sql3:sql sql_command)
;
(sql3:close)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
