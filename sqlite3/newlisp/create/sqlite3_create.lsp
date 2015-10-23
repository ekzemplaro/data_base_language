; -------------------------------------------------------------------
;	sqlite3_create.lsp
;
;					Sep/23/2013
;
; -------------------------------------------------------------------
(module "sqlite3.lsp")
; -------------------------------------------------------------------
(define (data_insert_proc id name population date_mod)
(setf sql_command (format
;	"insert into cities set id='%s',name='%s',population=%s,date_mod='%s'"
;	id name (string population) date_mod))
	"insert into cities values ('%s','%s',%s,'%s')"
	id name (string population) date_mod))
)

; -------------------------------------------------------------------
(println "*** 開始 ***")
;
(setf file_sqlite3 (main-args 3))
(println file_sqlite3)
(sql3:open file_sqlite3)

(sql3:sql "drop table if exists cities")
;(sql3:sql "drop table cities")
(sql3:sql "create table cities (id text NOT NULL PRIMARY KEY, name text, population int, date_mod text)")
;
(println (sql3:tables))
(println (sql3:columns "cities"))

(setf sql_command (data_insert_proc "t0711" "郡山" 72516 "1933-6-20"))
(println sql_command)
(sql3:sql sql_command)

(setf sql_command (data_insert_proc "t0712" "会津若松" 21785 "1933-9-11"))
(sql3:sql sql_command)

(setf sql_command (data_insert_proc "t0713" "白河" 61854 "1933-3-14"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0714" "福島" 83172 "1933-2-9"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0715" "喜多方" 42391 "1933-8-4"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0716" "二本松" 35187 "1933-1-21"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0717" "いわき" 81246 "1933-7-23"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0718" "相馬" 25784 "1933-10-26"))
(sql3:sql sql_command)
(setf sql_command (data_insert_proc "t0719" "須賀川" 78421 "1933-8-12"))
(sql3:sql sql_command)

(sql3:close)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
