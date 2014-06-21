; -------------------------------------------------------------------
;
;	sqlite3_update.lisp
;
;						May/15/2013
;
; -------------------------------------------------------------------
(load "/var/www/data_base/common/sbcl_common/text_manipulate.lisp")
; -------------------------------------------------------------------
(format t "*** 開始 ***~%")
(defvar id_in)
(defvar population_in)
(defvar today)
(defvar command)

(setf key_in (nth 6 *command-line-argument-list*))
(setf population_in (nth 7 *command-line-argument-list*))

(format t "~a ~a~%" key_in population_in)
(setf today (get_current_date_proc))
(setf command (format nil
	"update cities set population = ~a , DATE_MOD='~a' where ID='~a'"
	population_in today key_in))
(format t "~a~%" command)
;
(load "/usr/share/common-lisp/source/cl-asdf/asdf.lisp")
(require :asdf)
(require :clsql-sqlite3)
(clsql:connect '("/var/tmp/sqlite3/cities.db") :database-type :sqlite3)
(clsql:status)
(format t "~%")
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
