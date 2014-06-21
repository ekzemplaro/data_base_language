; -------------------------------------------------------------------
;
;	mysql_update.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/sbcl_common/text_manipulate.lisp")
; -------------------------------------------------------------------
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-mysql)
(format t "*** 開始 ***~%")
(defvar id_in)
(defvar population_in)
(defvar today)
(defvar command)

(setf key_in (nth 6 *command-line-argument-list*))
(setf population_in (parse-integer (nth 7 *command-line-argument-list*)))

(format t "~a ~a~%" key_in population_in)
(setf today (get_current_date_proc))
(setf command (format nil
	"update cities set population = ~a , DATE_MOD='~a' where ID='~a'"
	population_in today key_in))
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
