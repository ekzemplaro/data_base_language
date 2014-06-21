; -------------------------------------------------------------------
;
;	mysql_delete.lisp
;
;						May/15/2015
;
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
(defvar key_in)
(defvar command)

(setq key_in (nth 6 *command-line-argument-list*))

(format t "~a%" key_in)
(setf command (format nil
	"delete from cities where ID='~a'" key_in))
(format t "~a~%" command)
;
(clsql:connect '("host_mysql" "city" "scott" "tiger" 3306) :database-type :mysql)
(clsql:status)
(format t "~%")
(clsql:execute-command "SET NAMES utf8") 
(clsql:execute-command command) 
;
(clsql:disconnect)
(format t "*** 終了 ***~%")
(quit)
; -------------------------------------------------------------------
