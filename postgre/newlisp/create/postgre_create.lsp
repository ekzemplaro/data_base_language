#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	postgre_create.lsp
;
;					Jan/27/2014
;
; -------------------------------------------------------------------
(module "postgres.lsp")
; -------------------------------------------------------------------
(define (data_insert_proc id name population date_mod)
(setf sql_command (format
	"insert into cities values ('%s','%s',%s,'%s')"
	id name (string population) date_mod))
)

; -------------------------------------------------------------------
(println "*** 開始 ***")

(PgSQL:connect "localhost" "scott" "tiger" "city")

(PgSQL:query "drop table cities")
(PgSQL:query "create table cities (id varchar(10) primary key,name text,population int, date_mod date)")
;
(println (PgSQL:tables))
(println (PgSQL:fields "cities"))

(setf sql_command_aa "insert into cities values ('t3461','広島',73492,'1933-2-14')")
(setf sql_command_bb (data_insert_proc "t3461" "広島" 84165 "1933-2-30"))
;(println sql_command_aa)
(PgSQL:query sql_command_aa)

;
(setf sql_command (data_insert_proc "t3462" "福山" 72396 "1933-5-12"))
;(println sql_command)
(PgSQL:query sql_command)
;

(setf sql_command (data_insert_proc "t3463" "東広島" 18654 "1933-1-14"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3464" "呉" 83172 "1933-9-9"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3465" "尾道" 42591 "1933-8-4"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3466" "竹原" 35987 "1933-1-21"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3467" "三次" 81746 "1933-7-23"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3468" "大竹" 25784 "1933-10-26"))
(PgSQL:query sql_command)
(setf sql_command (data_insert_proc "t3469" "府中" 78421 "1933-8-12"))
(PgSQL:query sql_command)

(PgSQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
