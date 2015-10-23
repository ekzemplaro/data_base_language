; -------------------------------------------------------------------
;	mysql_read.lsp
;
;					Mar/03/2011
;
; -------------------------------------------------------------------
(module "mysql.lsp")
; -------------------------------------------------------------------
(println "*** 開始 ***")

(MySQL:init)
(MySQL:connect "host_mysql" "scott" "tiger" "city")

(MySQL:query "SET NAMES utf8")
(MySQL:query "select * from cities")
(println (MySQL:num-rows))
(println (MySQL:num-fields))
(setf list_aa (MySQL:fetch-all))
;(println list_aa)
;
(dolist (unit list_aa)
	(print (unit 0)) 
	(print "\t") 
	(print (unit 1)) 
	(print "\t") 
	(print (unit 2)) 
	(print "\t") 
	(println (unit 3)) 
	)
(MySQL:close-db)
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
