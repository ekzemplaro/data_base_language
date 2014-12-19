; -------------------------------------------------------------------
;	maria_create.lsp
;
;					Dec/15/2014
;
; -------------------------------------------------------------------
(module "mysql.lsp")
; -------------------------------------------------------------------
(define (data_insert_proc id name population date_mod)
(setf sql_command (format
	"insert into cities set id='%s',name='%s',population=%s,date_mod='%s'"
	id name (string population) date_mod))
)

; -------------------------------------------------------------------
(println "*** 開始 ***")

;
(MySQL:init)
(MySQL:connect "localhost" "scott" "tiger" "city")

(MySQL:query "drop table if exists cities")
(MySQL:query "create table cities (id varchar(10) primary key, name text, population int, date_mod date)")

(setf sql_command (data_insert_proc "t3321" "岡山" 493125 "1933-7-30"))
(MySQL:query sql_command)

(setf sql_command (data_insert_proc "t3322" "倉敷" 162837 "1933-5-10"))
(MySQL:query sql_command)

(setf sql_command (data_insert_proc "t3323" "津山" 718954 "1933-6-14"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3324" "玉野" 831472 "1933-9-9"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3325" "笠岡" 423591 "1933-8-4"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3326" "井原" 351687 "1933-1-21"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3327" "総社" 812346 "1933-7-23"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3328" "高梁" 257984 "1933-10-26"))
(MySQL:query sql_command)
(setf sql_command (data_insert_proc "t3329" "新見" 784521 "1933-8-12"))
(MySQL:query sql_command)


(MySQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
