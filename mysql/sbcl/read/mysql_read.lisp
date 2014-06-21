#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mysql_read.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(require :asdf)
(require :clsql-uffi)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
(clsql:connect '("host_mysql" "city" "scott" "tiger" 3306) :database-type :mysql)
(clsql:status)
(format t "~%")
(clsql:execute-command "SET NAMES utf8") 
(mapc
	#'(lambda (lst)
;		(format t "~A~%" lst)
		(format t "~a	~a	~a	~a~%"
			(car lst) (cadr lst) (caddr lst) (nth 3 lst))
		)
		(clsql:query "select * from cities"))
;
(clsql:disconnect)
(format t "*** 終了 ***~%")
; -------------------------------------------------------------------
