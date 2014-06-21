#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mysql_delete.lisp
;
;						May/15/2015
;
; -------------------------------------------------------------------
(require :asdf)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
(defvar id_in)
(defvar command)

(setf id_in (cadr *posix-argv*))


(format t "~a%" id_in)
(setf command (format nil
	"delete from cities where ID='~a'" id_in))
(format t "~a~%" command)
;
(clsql:connect '("host_mysql" "city" "scott" "tiger" 3306) :database-type :mysql)
(clsql:status)
(format t "~%")
(clsql:execute-command "SET NAMES utf8") 
(clsql:execute-command command) 
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
