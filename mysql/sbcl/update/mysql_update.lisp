#! /usr/bin/sbcl --script
; -------------------------------------------------------------------
;
;	mysql_update.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/sbcl_common/text_manipulate.lisp")
; -------------------------------------------------------------------
(require :asdf)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
(defvar id_in)
(defvar population_in)
(defvar today)
(defvar command)

(setf id_in (cadr *posix-argv*))

(setf population_in (caddr *posix-argv*))

(format t "~a ~a~%" id_in population_in)
(setf today (get_current_date_proc))
(setf command (format nil
	"update cities set population = ~a , DATE_MOD='~a' where ID='~a'"
	population_in today id_in))
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
